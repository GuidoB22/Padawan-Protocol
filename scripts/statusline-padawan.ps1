# Statusline de Claude Code como mini dashboard (2 lineas, con barras y colores).
# Lee el JSON de la sesion por stdin y escribe una fila por linea.
# Si falta algun dato (por ejemplo los limites fuera de planes Pro o Max), esa parte no se dibuja.
# Probado en Windows PowerShell 5.1. No necesita instalar nada mas.

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Caracteres por codigo, para que el archivo funcione aunque se guarde sin UTF-8.
$esc = [char]27
$RESET = "$esc[0m"; $DIM = "$esc[2m"
$GREEN = "$esc[32m"; $AMBER = "$esc[33m"; $RED = "$esc[31m"; $CYAN = "$esc[36m"
$FULL = [string][char]0x2593; $EMPTY = [string][char]0x2591; $DOT = [string][char]0xB7

$raw = $input | Out-String
try { $d = $raw | ConvertFrom-Json } catch { $d = $null }

function Get-Color($pct) { if ($pct -lt 60) { $GREEN } elseif ($pct -lt 85) { $AMBER } else { $RED } }

function Get-Bar($pct, $width = 10) {
    $pct = [math]::Max(0, [math]::Min(100, [double]$pct))
    $filled = [int][math]::Round($pct / 100 * $width)
    (Get-Color $pct) + ($FULL * $filled) + $DIM + ($EMPTY * ($width - $filled)) + $RESET
}

function Get-Eta($resetsAt) {
    if ($null -eq $resetsAt) { return '' }
    $secs = [int64]$resetsAt - [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    if ($secs -le 0) { return '' }
    $days = [math]::Floor($secs / 86400); $hours = [math]::Floor(($secs % 86400) / 3600); $mins = [math]::Floor(($secs % 3600) / 60)
    if ($days -gt 0) { return "reinicia en ${days}d${hours}h" }
    if ($hours -gt 0) { return ('reinicia en {0}h{1:00}' -f $hours, $mins) }
    return "reinicia en $mins min"
}

function Get-Meter($label, $pct, $extra = '') {
    $c = Get-Color $pct
    $warn = if ($pct -ge 90) { " ${RED}!${RESET}" } else { '' }
    $tail = if ($extra) { " ${DIM}${extra}${RESET}" } else { '' }
    '{0}{1}{2} {3} {4}{5}%{2}{6}{7}' -f $DIM, $label, $RESET, (Get-Bar $pct), $c, [int][math]::Round([double]$pct), $warn, $tail
}

# Rama de git, con cache de 5 segundos para no frenar la barra en repositorios grandes.
function Get-Branch($cwd) {
    if (-not $cwd) { return '' }
    $cache = Join-Path ([System.IO.Path]::GetTempPath()) 'claude-statusline-branch.txt'
    if (Test-Path $cache) {
        $age = (Get-Date) - (Get-Item $cache).LastWriteTime
        $parts = (Get-Content $cache -Raw) -split "`n", 2
        if ($age.TotalSeconds -lt 5 -and $parts[0].Trim() -eq $cwd) { return $parts[1].Trim() }
    }
    $branch = (& git -C $cwd rev-parse --abbrev-ref HEAD 2>$null | Out-String).Trim()
    Set-Content -Path $cache -Value "$cwd`n$branch" -Encoding UTF8
    return $branch
}

$model = if ($d.model.display_name) { $d.model.display_name } else { 'Claude' }
$cwd = if ($d.workspace.current_dir) { $d.workspace.current_dir } else { $d.cwd }
$folder = if ($cwd) { Split-Path ($cwd -replace '/', '\') -Leaf } else { '' }
$branch = Get-Branch $cwd

$head = @("$CYAN$model$RESET")
if ($folder) { $head += $folder }
if ($branch) { $head += "git:$branch" }
if ($null -ne $d.cost.total_cost_usd) {
    $usd = ([double]$d.cost.total_cost_usd).ToString('0.00', [System.Globalization.CultureInfo]::InvariantCulture)
    $head += "$DIM`$$usd$RESET"
}
$lines = @($head -join " $DIM$DOT$RESET ")

$segs = @()
if ($null -ne $d.context_window.used_percentage) { $segs += Get-Meter 'contexto' $d.context_window.used_percentage }
$five = $d.rate_limits.five_hour
if ($null -ne $five.used_percentage) { $segs += Get-Meter '5 h' $five.used_percentage (Get-Eta $five.resets_at) }
$week = $d.rate_limits.seven_day
if ($null -ne $week.used_percentage) { $segs += Get-Meter 'semana' $week.used_percentage (Get-Eta $week.resets_at) }

# Acomoda los segmentos en lineas que entren en el ancho de la terminal.
$cols = 100
if ($env:COLUMNS -match '^\d+$') { $cols = [int]$env:COLUMNS }
$cur = ''; $curW = 0
foreach ($s in $segs) {
    $w = ($s -replace "$esc\[[0-9;]*m", '').Length
    if ($cur -and ($curW + 3 + $w) -gt $cols) { $lines += $cur; $cur = $s; $curW = $w }
    elseif ($cur) { $cur = "$cur   $s"; $curW += 3 + $w }
    else { $cur = $s; $curW = $w }
}
if ($cur) { $lines += $cur }

$lines -join "`n"
