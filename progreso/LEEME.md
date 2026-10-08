# 🗺️ Mapa del Padawan

Un mapa visual de tu avance en Padawan Protocol. Se abre en el navegador, **no necesita internet ni instalar nada**, y se va "encendiendo" a medida que completás niveles.

> [!WARNING]
> **Esta función está en prueba.** Se probó con distintos estados y con la opción "reducir movimiento" del sistema, pero todavía nadie nuevo la usó siguiendo la guía de punta a punta.

## Cómo se lee

| Color | Significa |
|---|---|
| 🟢 Verde | **Habilitado**: ya lo completaste o lo estás usando |
| 🟡 Amarillo | **En curso**: lo estás armando ahora |
| 🟠 Naranja | **Pendiente**: todavía no llegaste |

Los puntitos viajan por las flechas **solo hacia lo habilitado o en curso**. Lo pendiente queda apagado, con la línea punteada. Arriba ves tu **rango** (Padawan, Caballero Jedi o Maestro Jedi) y abajo, tres recuadros: tu progreso, el próximo paso y un consejo.

Abrilo con doble clic en `mapa-de-progreso.html`, o pedile a tu agente que lo abra.

## Para el agente: cómo actualizarlo

Cada vez que **confirmás el checkpoint de un nivel** (Regla #8 de `INSTRUCCIONES-AGENTE.md`):

1. Abrí `progreso/mapa-de-progreso.html` y buscá el bloque `<script type="application/json" id="spec">`. Cada caja está en **una sola línea**.
2. Cambiá **solo** el valor de `"type"` de las cajas que correspondan, con un reemplazo de texto sobre esa línea:

| `type` | Estado |
|---|---|
| `bus` | Pendiente |
| `cloud` | En curso |
| `backend` | Habilitado |

3. Qué cambiar al confirmar el Nivel **N**: la caja `nN` pasa a `backend` y la del Nivel **N+1** pasa a `cloud`. Cada herramienta copia el estado de su nivel:

| Nivel | Caja del nivel | Herramienta que se habilita |
|---|---|---|
| 00 Contexto | `n0` | `t0` (`quien-soy.md`) |
| 01 Fundamentos | `n1` | (ninguna) |
| 02 Memoria | `n2` | `t2` (`memoria.md`) |
| 03 Segundo cerebro | `n3` | `t3` (Vault + MCP) |
| 04 Vocabulario | `n4` | (ninguna) |
| 05 Persona propia | `n5` | `t5` (`CLAUDE.md`) |
| 06 Avanzado | `n6` | `t6` (Skills y rutinas) |

4. **No toques nada más del archivo.** El rango, los puntitos y los recuadros se calculan solos.
5. **Abrilo para la persona**: en Windows `start "" "progreso\mapa-de-progreso.html"`, en Mac `open progreso/mapa-de-progreso.html`, en Linux `xdg-open progreso/mapa-de-progreso.html`. Si no podés abrirlo, decile la ruta del archivo.
6. Si la persona retoma otro día, leé `memoria.md` y dejá el mapa coherente con el último nivel confirmado.

## Créditos

Está hecho sobre la plantilla del skill `diagram`, que adapta el trabajo de [archify](https://github.com/tt-a1i/archify) (licencia MIT). Ver [LICENCIA-archify.md](LICENCIA-archify.md).
