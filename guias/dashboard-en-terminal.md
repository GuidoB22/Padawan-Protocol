# 🧭 Un mini dashboard en la barra de tu terminal

> [!WARNING]
> **Esta guía está en prueba y es solo para Claude Code en la terminal de Windows.** Se probó con datos de ejemplo en Windows PowerShell 5.1. Todavía nadie nuevo la usó siguiendo esta guía, y no la probamos en Mac ni Linux.

Si usás **Claude Code en la terminal**, tenés una barra fija abajo que se puede personalizar. Con este script esa barra pasa a ser un mini dashboard de dos líneas, con barras de colores:

```
Opus 5.5 · padawan-wt · git:docs/ficha-de-pedido · $0.42
contexto ▓░░░░░░░░░ 13%   5 h ▓▓▓▓░░░░░░ 45% reinicia en 4h27   semana ▓▓▓▓▓▓▓▓▓░ 94% ! reinicia en 16h57
```

| Dato | Qué te dice |
|---|---|
| **Modelo, carpeta y rama** | Dónde estás parado |
| **Costo** | Lo que va gastando la sesión, estimado a precio de lista |
| **contexto** | Cuánto de la memoria de la conversación ya se usó |
| **5 h y semana** | Cuánto llevás usado de tu plan y cuándo se reinicia |

Los colores avisan solos: **verde** hasta el 60%, **amarillo** hasta el 85% y **rojo** desde ahí. Con un `!` cuando pasás el 90%.

## Qué no hace

- **No muestra tus rutinas ni tu second brain.** La barra solo recibe datos de la sesión. Para eso mirá el [mapa de progreso](../progreso/LEEME.md).
- **5 h y semana solo aparecen con planes Pro o Max.** Con otro plan o con una API key esas partes no se dibujan, y no pasa nada.
- **Es de Claude Code.** Si usás otro agente, esta barra no existe; usá el mapa y la ficha de [cómo pedir](como-pedir.md).

## Instalarlo, la forma fácil

Pedile a tu agente, con la ficha de [cómo pedir](como-pedir.md):

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Rol:      Asistente de configuración
> Objetivo: Instalar el mini dashboard en mi terminal de Claude Code
> Detalle:  Copiá scripts/statusline-padawan.ps1 a mi carpeta .claude,
>           hacé una copia de settings.json y pedime permiso antes de
>           tocarlo. Después mostrame cómo volver atrás.
> ```

Tu agente va a tocar un archivo de configuración, así que **te tiene que pedir permiso** y mostrarte qué cambia.

## Instalarlo a mano

1. Copiá `scripts/statusline-padawan.ps1` a la carpeta `.claude` de tu usuario (`C:\Users\TU_USUARIO\.claude\`).
2. Hacé una copia de `C:\Users\TU_USUARIO\.claude\settings.json` por si querés volver atrás.
3. Abrí `settings.json` y agregá este bloque. **Usá barras `/`, no `\`**, o el comando falla sin avisar:

```json
"statusLine": {
  "type": "command",
  "command": "powershell -NoProfile -File C:/Users/TU_USUARIO/.claude/statusline-padawan.ps1",
  "refreshInterval": 30
}
```

Si ya había un `statusLine`, reemplazalo. Si el archivo ya tiene otras opciones, separá los bloques con una coma.

4. Cerrá la sesión de Claude Code y abrí una nueva.

## Volver atrás

Poné de nuevo tu copia de `settings.json`, o borrá el bloque `statusLine`. La barra vuelve a la de siempre.

## Si algo no se ve bien

| Qué ves | Qué hacer |
|---|---|
| No aparece nada | Revisá las barras `/` en la ruta y que el archivo esté en la carpeta que escribiste |
| Cuadraditos en vez de barras | Tu terminal o tu fuente no muestra esos símbolos. Probá con Windows Terminal |
| Faltan 5 h y semana | Esos datos llegan solo con planes Pro o Max, y después de la primera respuesta de la sesión |
| La barra se corta | Ensanchá la ventana: el script acomoda las líneas según el ancho |

## Checkpoint

Mirá la barra con una conversación en marcha y contale a tu agente **con tus palabras** qué significa cada barra y por qué cambia de color.
