# Chequeo de estado de Padawan Protocol (Windows / PowerShell)
#
# Revisa que hay armado en esta carpeta y lo muestra en colores:
# verde = listo, gris = todavia no, amarillo = instalado pero mal configurado.
# No modifica nada — es de solo lectura.

Write-Host ""
Write-Host "Chequeo de estado -- Padawan Protocol" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

function Show-Check {
    param([string]$Label, [bool]$Ok)
    if ($Ok) {
        Write-Host "  [OK] $Label" -ForegroundColor Green
    } else {
        Write-Host "  [ ]  $Label" -ForegroundColor DarkGray
    }
}

Show-Check "Nivel 00 -- contexto (quien-soy.md)" (Test-Path "quien-soy.md")
Show-Check "Nivel 02 -- memoria persistente (memoria.md)" (Test-Path "memoria.md")
Show-Check "Nivel 03 -- Obsidian abierto (.obsidian/)" (Test-Path ".obsidian")
Show-Check "Plugin Dataview" (Test-Path ".obsidian/plugins/dataview")
Show-Check "Plugin Git (obsidian-git)" (Test-Path ".obsidian/plugins/obsidian-git")
Show-Check "Plugin Local REST API (MCP)" (Test-Path ".obsidian/plugins/obsidian-local-rest-api")

$dataJsonPath = ".obsidian/plugins/obsidian-local-rest-api/data.json"
if (Test-Path $dataJsonPath) {
    try {
        $data = Get-Content $dataJsonPath -Raw | ConvertFrom-Json
        if ($data.enableInsecureServer -eq $true) {
            Write-Host "  [OK] Servidor HTTP del MCP habilitado (puerto $($data.insecurePort))" -ForegroundColor Green
        } else {
            Write-Host "  [!]  Servidor HTTP del MCP DESHABILITADO -- ver PROBLEMAS-FRECUENTES.md" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "  [!]  No se pudo leer data.json del plugin MCP" -ForegroundColor Yellow
    }
    if (git ls-files $dataJsonPath 2>$null) {
        Write-Host "  [!]  La clave del MCP (data.json) esta versionada en git -- sacala con: git rm --cached `"$dataJsonPath`"" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Esto es solo un vistazo rapido -- tu agente decide con vos que nivel sigue." -ForegroundColor DarkGray
Write-Host ""
