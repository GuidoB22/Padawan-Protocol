# dibujar-flujo.ps1 - dibuja un flujo de pasos en la terminal.
# Estructura (recuadros, flechas, texto) en blanco; el color solo marca el estado.
# Reutilizable: no sabe nada de ningun proyecto, recibe los pasos por parametro.
#
# Ejemplos:
#   .\dibujar-flujo.ps1 -Pasos "Pedis,Falta algo?,Se hace,Entrega" -Actual 2
#   .\dibujar-flujo.ps1 -Pasos "Juntar gastos,Categorizar,Ver el total" -Actual 2 -Hoja
#   .\dibujar-flujo.ps1 -Pasos "A,B,C" -Actual 1 -SinColor
param(
    [Parameter(Mandatory = $true)][string]$Pasos,  # separados por coma
    [int]$Actual = 1,                              # paso en curso (1..N); N+1 = todo hecho
    [switch]$Hoja,                                 # lista vertical en vez de recuadros
    [switch]$SinColor,                             # solo simbolos, sin ANSI
    [switch]$Ascii                                 # solo caracteres ASCII (consolas viejas)
)

. "$PSScriptRoot\_estilo-consola.ps1"   # paleta, estilos y simbolos compartidos

$lista = @($Pasos.Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ })
if ($lista.Count -eq 0) { Write-Error "Pasos vacio."; exit 1 }

function Estado([int]$n) {
    if ($n -lt $Actual) { 'hecho' } elseif ($n -eq $Actual) { 'actual' } else { 'pendiente' }
}
function Simbolo([string]$estado) {
    switch ($estado) { 'hecho' { $s.ok } 'actual' { $s.ahora } default { $s.luego } }
}

# --- Vista vertical (hoja de ruta), o automatica si no entra en el ancho ---
$ancho = ($lista | Measure-Object -Property Length -Maximum).Maximum + 4
$anchoTotal = $lista.Count * ($ancho + 2) + ($lista.Count - 1) * 4
$anchoTerm = AnchoTerminal
$vertical = $Hoja -or ($anchoTotal -gt $anchoTerm)

Write-Host ""
if ($vertical) {
    for ($i = 0; $i -lt $lista.Count; $i++) {
        $e = Estado ($i + 1)
        $txt = "  $(Simbolo $e) $($i + 1) $($lista[$i])"
        if ($e -eq 'actual') { $txt += "   $($s.aqui)" }
        Write-Host (Pintar $txt $e)
    }
} else {
    $l1 = ""; $l2 = ""; $l3 = ""; $l4 = ""
    for ($i = 0; $i -lt $lista.Count; $i++) {
        $e = Estado ($i + 1)
        $marca = if ($e -eq 'actual') { $s.ahora + ' ' + $s.aca } else { '' }
        $l4 += $marca.PadRight($ancho + 2)
        if ($i -lt $lista.Count - 1) { $l4 += "    " }
        $c = if ($e -eq 'actual') { 'actual' } else { 'estructura' }
        $t = $lista[$i].PadRight($ancho - 2)
        $l1 += Pintar ($s.tl + ($s.h * $ancho) + $s.tr) $c
        $l2 += (Pintar $s.v $c) + " $t " + (Pintar $s.v $c)   # letra en color normal
        $l3 += Pintar ($s.bl + ($s.h * $ancho) + $s.br) $c
        if ($i -lt $lista.Count - 1) {
            $l1 += "    "; $l2 += " " + (Pintar $s.flecha 'estructura') + " "; $l3 += "    "
        }
    }
    Write-Host $l1
    Write-Host $l2
    Write-Host $l3
    Write-Host (Pintar $l4.TrimEnd() 'actual')
}
Write-Host ""
