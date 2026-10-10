# dibujar-tarjeta.ps1 - tarjeta de dos cajas para explicar algo en la terminal.
# Izquierda: texto corto con titulos. Derecha: un flujo y un reparto en %.
# Reutilizable: el contenido vive en un archivo .json; este script solo dibuja.
#
# Ejemplo:
#   .\dibujar-tarjeta.ps1 -Datos .\ejemplos\tarjeta-lorem.json
#   .\dibujar-tarjeta.ps1 -Datos .\ejemplos\tarjeta-lorem.json -SinColor
#
# Formato del .json (todo menos "bloques" es opcional):
#   { "caja_izq": "...", "caja_der": "...",
#     "bloques": [ { "titulo": "...", "texto": ["..."], "consejo": ["..."] } ],
#     "proximo": "...",
#     "flujo":   { "titulo": "...", "pasos": ["A","B","C"], "actual": 2 },
#     "reparto": { "titulo": "...", "items": [ { "etiqueta": "...", "valor": 70 } ] } }
param(
    [Parameter(Mandatory = $true)][string]$Datos,  # ruta al .json con el contenido
    [switch]$SinColor,                             # solo simbolos y estilos, sin ANSI
    [switch]$Ascii                                 # solo caracteres ASCII (consolas viejas)
)

. "$PSScriptRoot\_estilo-consola.ps1"   # paleta, estilos y simbolos compartidos

if (-not (Test-Path -LiteralPath $Datos)) { Write-Error "No existe el archivo: $Datos"; exit 1 }
$d = Get-Content -LiteralPath $Datos -Raw -Encoding UTF8 | ConvertFrom-Json

$LI = 32   # ancho interior de la caja izquierda
$RI = 38   # ancho interior de la caja derecha (total: 75 columnas)

# Una linea es una lista de segmentos (texto + estilo). Se mide el texto plano
# y recien despues se pinta, asi el relleno no se rompe con los codigos ANSI.
function Seg([string]$t, [string]$e = '') { @{ t = $t; e = $e } }
function Largo($linea) { $n = 0; foreach ($g in $linea) { $n += $g.t.Length }; $n }
function Dibujar($linea) {
    ($linea | ForEach-Object { if ($_.e) { Pintar $_.t $_.e } else { $_.t } }) -join ''
}
function Agregar($lista, [string]$t, [string]$e = '') { $lista.Add([object[]]@((Seg $t $e))) }

function Envolver([string]$texto, [int]$ancho) {
    $sangria = ''
    if ($texto -match '^(\d+\.\s+)') { $sangria = ' ' * $Matches[1].Length }
    $out = New-Object System.Collections.Generic.List[string]
    $cur = ''
    foreach ($w in ($texto -split ' ')) {
        $prueba = if ($cur) { "$cur $w" } else { $w }
        if ($prueba.Length -le $ancho) { $cur = $prueba }
        else { if ($cur) { $out.Add($cur) }; $cur = $sangria + $w }
    }
    if ($cur) { $out.Add($cur) }
    foreach ($l in $out) { if ($l.Length -gt $ancho) { $l.Substring(0, $ancho) } else { $l } }
}

function Caja([string]$titulo, $lineas, [int]$inner) {
    if ($titulo.Length -gt $inner - 4) { $titulo = $titulo.Substring(0, $inner - 4) }
    $res = New-Object System.Collections.Generic.List[object]
    $res.Add([object[]]@(
        (Seg ($s.tl + $s.h + ' ') 'estructura'),
        (Seg $titulo 'titulo'),
        (Seg (' ' + ($s.h * ($inner - $titulo.Length - 3)) + $s.tr) 'estructura')))
    foreach ($l in $lineas) {
        $falta = [Math]::Max(0, ($inner - 1) - (Largo $l))
        $fila = New-Object System.Collections.Generic.List[object]
        $fila.Add((Seg ($s.v + ' ') 'estructura'))
        foreach ($g in $l) { $fila.Add($g) }
        $fila.Add((Seg ((' ' * $falta) + $s.v) 'estructura'))
        $res.Add($fila.ToArray())
    }
    $res.Add([object[]]@((Seg ($s.bl + ($s.h * $inner) + $s.br) 'estructura')))
    $res
}

# ---------- Caja izquierda: texto con jerarquia ----------
$izq = New-Object System.Collections.Generic.List[object]
foreach ($b in @($d.bloques)) {
    if ($izq.Count -gt 0) { Agregar $izq '' }
    Agregar $izq $b.titulo 'subtitulo'
    foreach ($t in @($b.texto)) { foreach ($l in @(Envolver $t ($LI - 1))) { Agregar $izq $l } }
    foreach ($t in @($b.consejo)) { if ($t) { foreach ($l in @(Envolver $t ($LI - 1))) { Agregar $izq $l 'consejo' } } }
}
if ($d.proximo) {
    if ($izq.Count -gt 0) { Agregar $izq '' }
    Agregar $izq ($s.flecha + ' Próximo paso') 'proximo'
    foreach ($l in @(Envolver $d.proximo ($LI - 1))) { Agregar $izq $l }
}

# ---------- Caja derecha: flujo + reparto ----------
$der = New-Object System.Collections.Generic.List[object]

if ($d.flujo) {
    $pasos = @($d.flujo.pasos); $act = [int]$d.flujo.actual
    $titFlujo = if ($d.flujo.titulo) { $d.flujo.titulo } else { 'Tu camino' }
    Agregar $der $titFlujo 'subtitulo'
    Agregar $der ''
    $w = [Math]::Max(6, ($pasos | Measure-Object -Property Length -Maximum).Maximum)
    $total = $pasos.Count * ($w + 2) + ($pasos.Count - 1) * 4
    if ($total -le ($RI - 1)) {
        $r1 = New-Object System.Collections.Generic.List[object]
        $r2 = New-Object System.Collections.Generic.List[object]
        $r3 = New-Object System.Collections.Generic.List[object]
        $r4 = New-Object System.Collections.Generic.List[object]
        for ($i = 0; $i -lt $pasos.Count; $i++) {
            $c = if (($i + 1) -eq $act) { 'actual' } else { 'estructura' }
            $izqPad = [int][Math]::Floor(($w - $pasos[$i].Length) / 2)
            $txt = ((' ' * $izqPad) + $pasos[$i]).PadRight($w)
            $r1.Add((Seg ($s.tl + ($s.h * $w) + $s.tr) $c))
            # borde con el color de la caja; la letra de adentro con el color normal
            $r2.Add((Seg $s.v $c)); $r2.Add((Seg $txt)); $r2.Add((Seg $s.v $c))
            $r3.Add((Seg ($s.bl + ($s.h * $w) + $s.br) $c))
            $marca = if (($i + 1) -eq $act) { "$($s.ahora) $($s.aca)" } else { '' }
            $r4.Add((Seg $marca.PadRight($w + 2) 'actual'))
            if ($i -lt $pasos.Count - 1) {
                $r1.Add((Seg '    ')); $r3.Add((Seg '    ')); $r4.Add((Seg '    '))
                $r2.Add((Seg ' ')); $r2.Add((Seg $s.flecha 'estructura')); $r2.Add((Seg ' '))
            }
        }
        foreach ($r in @($r1, $r2, $r3, $r4)) { $der.Add($r.ToArray()) }
    } else {
        for ($i = 0; $i -lt $pasos.Count; $i++) {
            $e = if (($i + 1) -lt $act) { 'hecho' } elseif (($i + 1) -eq $act) { 'actual' } else { 'pendiente' }
            $sim = switch ($e) { 'hecho' { $s.ok } 'actual' { $s.ahora } default { $s.luego } }
            $txt = "$sim $($i + 1) $($pasos[$i])"
            if ($e -eq 'actual') { $txt += "  $($s.aqui)" }
            Agregar $der $txt $e
        }
    }
}

if ($d.reparto) {
    $items = @($d.reparto.items | Select-Object -First 4)
    $suma = ($items | Measure-Object -Property valor -Sum).Sum
    if ($der.Count -gt 0) { Agregar $der '' }
    $titRep = if ($d.reparto.titulo) { $d.reparto.titulo } else { 'Cómo se reparte' }
    Agregar $der $titRep 'subtitulo'
    Agregar $der ''
    $ancho = $RI - 1
    $barra = New-Object System.Collections.Generic.List[object]
    $acum = 0; $prev = 0
    for ($i = 0; $i -lt $items.Count; $i++) {
        $acum += $items[$i].valor
        $borde = [int][Math]::Round($acum / $suma * $ancho)
        $barra.Add((Seg ($s.relleno[$i] * ($borde - $prev)) $(if ($i -eq 0) { 'actual' } else { '' })))
        $prev = $borde
    }
    $der.Add($barra.ToArray())
    Agregar $der ''
    for ($i = 0; $i -lt $items.Count; $i++) {
        $pct = [int][Math]::Round($items[$i].valor * 100 / $suma)
        $der.Add([object[]]@(
            (Seg $s.relleno[$i] $(if ($i -eq 0) { 'actual' } else { '' })),
            (Seg (' {0,3}%  {1}' -f $pct, $items[$i].etiqueta))))
    }
}

# ---------- Armado: lado a lado si entra, apiladas si no ----------
$tI = if ($d.caja_izq) { $d.caja_izq } else { 'Explicación' }
$tD = if ($d.caja_der) { $d.caja_der } else { 'Mirá esto' }
# Ojo: PowerShell no distingue mayusculas, por eso $cajaI/$cajaD y no $A/$B + $a/$b.
$cajaI = @(Caja $tI $izq $LI)
$cajaD = @(Caja $tD $der $RI)

Write-Host ""
if ((AnchoTerminal) -ge ($LI + $RI + 5)) {
    $n = [Math]::Max($cajaI.Count, $cajaD.Count)
    for ($i = 0; $i -lt $n; $i++) {
        $textoI = if ($i -lt $cajaI.Count) { Dibujar $cajaI[$i] } else { ' ' * ($LI + 2) }
        $textoD = if ($i -lt $cajaD.Count) { Dibujar $cajaD[$i] } else { '' }
        Write-Host ($textoI + ' ' + $textoD).TrimEnd()
    }
} else {
    foreach ($l in $cajaI) { Write-Host (Dibujar $l) }
    Write-Host ""
    foreach ($l in $cajaD) { Write-Host (Dibujar $l) }
}
Write-Host ""
