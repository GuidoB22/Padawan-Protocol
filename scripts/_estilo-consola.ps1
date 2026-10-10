# _estilo-consola.ps1 - estilo compartido de los scripts que dibujan en la terminal.
# Se carga con:  . "$PSScriptRoot\_estilo-consola.ps1"
# Espera que el script que lo carga haya declarado los switches $SinColor y $Ascii.
#
# Regla de diseno: la estructura (cajas, flechas) va en blanco; el color solo
# significa estado o jerarquia. Siempre hay un simbolo o un estilo ademas del color.

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# --- Color: se apaga con -SinColor, con NO_COLOR o si la salida va a un archivo ---
# FORCE_COLOR=1 lo fuerza (util para probar o para capturar la salida con colores).
$usarColor = (-not ($SinColor -or $env:NO_COLOR)) -and
             ($env:FORCE_COLOR -or -not [Console]::IsOutputRedirected)
$esc = [char]27

# --- Paleta: el unico lugar donde se cambian los colores y estilos ---
$p = @{
    estructura = "97"      # blanco: cajas y flechas
    hecho      = "92"      # verde
    actual     = "93"      # amarillo: estas aca
    pendiente  = "90"      # gris
    titulo     = "1;96"    # negrita + cian: solo titulos
    tenue      = "2"       # aclaraciones
    consejo    = "3"       # cursiva
    proximo    = "1;4"     # negrita + subrayado: el proximo paso
}
function Pintar([string]$texto, [string]$estilo) {
    if (-not $usarColor -or -not $estilo) { return $texto }
    "$esc[$($p[$estilo])m$texto$esc[0m"
}

# --- Simbolos (siempre acompanan al color) ---
if ($Ascii) {
    $s = @{ tl = '+'; tr = '+'; bl = '+'; br = '+'; h = '-'; v = '|'; flecha = '->'
            ok = 'v'; ahora = '*'; luego = 'o'; aqui = '<-- estas aca'; aca = 'aca'
            relleno = @('#', '=', '-', '.') }
} else {
    $s = @{ tl = '┌'; tr = '┐'; bl = '└'; br = '┘'; h = '─'; v = '│'; flecha = '─►'
            ok = '✓'; ahora = '●'; luego = '○'; aqui = '◄── estás acá'; aca = 'acá'
            relleno = @('█', '▓', '▒', '░') }
}

# --- Ancho de la terminal (80 si no se puede saber) ---
function AnchoTerminal {
    $w = try { [Console]::WindowWidth } catch { 0 }
    if ($w -le 0) { 80 } else { $w }
}
