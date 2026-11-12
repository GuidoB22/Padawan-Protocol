# 🧭 Misión 01 — Elegir la app y el issue

**Requiere: el gate y la preparación del [README del sendero](README.md).**

> [!WARNING]
> **Esta misión está en prueba.** Sale de un ejercicio real, pero todavía nadie nuevo la siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../../COMO-PEDIR-AYUDA.md).

## Lo que vas a lograr

Elegir una aplicación de práctica y un bug concreto, y comprobar **antes de levantar nada** que ese bug no esté ya resuelto. Todo queda en tu bitácora.

## Elegir la aplicación

| Criterio | Por qué importa |
|---|---|
| Un lenguaje que puedas leer (PHP, Python, JS, etc.) | Si no entendés el código, no podés proponer un fix |
| Se levanta con `docker compose` o con un README claro | Menos fricción de entorno |
| Tiene interfaz web | Reproducir errores haciendo clic es mucho más fácil |
| Commits recientes y no archivada | Si nadie mira los PRs, el esfuerzo se pierde |
| Tiene `CONTRIBUTING.md` y plantilla de PR | Te dice las reglas antes de que las rompas |
| Issues con etiquetas `bug` o `good first issue` | Hay trabajo chico disponible |

Búsqueda (cambiá el lenguaje según lo que conozcas):

```
gh search repos --language=php --good-first-issues=">=5" --stars=">500" --archived=false --sort=updated -L 20
```

Revisar un candidato:

```
gh repo view OWNER/REPO --json pushedAt,stargazerCount,licenseInfo,description
```

**Checkpoint parcial:** elegí una app y anotá en la bitácora qué criterios cumple.

## Elegir el issue

Bugs abiertos y sin asignado:

```
gh search issues --repo OWNER/REPO --label bug --state open --no-assignee --sort updated -L 20
```

Un issue sirve si cumple **todo** esto:

- Es un bug con pasos para reproducir.
- Se reproduce usando la aplicación (hay que correrla, no alcanza con leer código).
- Sin persona asignada.
- Sin PR que lo mencione: `gh search prs --repo OWNER/REPO NUMERO_DEL_ISSUE` devuelve vacío.
- El arreglo parece chico.

Descartalo si es una lista de sugerencias, algo "por diseño", un pedido de función grande o si no trae pasos.

🔴 **Lección:** nuestro primer intento fue un issue con una lista de cambios sugeridos sobre un archivo de configuración. Lo descartamos: una sugerencia ya estaba hecha, tres eran "por diseño" y ni hacía falta correr la app.

## ¿Ya está arreglado? Hacelo ANTES de levantar nada

🔴 **Lección:** nos pasó que el bug ya estaba arreglado en una versión más nueva, un día antes de abrirse el issue. Perdimos horas reproduciendo algo resuelto. Esta revisión toma 5 minutos y necesita el repositorio clonado (el clone está en la misión 02, pendiente; si todavía no lo tenés, clonalo ahora solo para mirar el historial):

```
git fetch --all --tags
git log --oneline -10 origin/develop -- ruta/del/archivo
git log --oneline -S"texto_clave" -- ruta/del/archivo
git tag --contains SHA_DEL_COMMIT
git show TAG:ruta/del/archivo
```

Preguntas a responder:

- ¿Qué versión reporta el issue?
- ¿Hay commits posteriores sobre ese archivo que lo mencionen?
- ¿En qué versión (tag) llegó el arreglo, si existe?

## Reclamar el issue

Dejá un comentario corto y amable en el issue, por ejemplo: `I'd like to work on this`. Lo escribís y lo posteás vos, no tu agente: es un mensaje público con tu nombre.

## Leer las reglas del proyecto

Abrí `CONTRIBUTING.md` y la plantilla de PR (en `.github/`). Anotá:

- Rama destino. Ejemplo de lo que podés encontrar: apuntar a la rama de la versión más antigua donde existe el bug.
- Formato del título. Ejemplo: una palabra en mayúscula al inicio para que el cambio entre al registro de novedades.
- Si piden capturas.
- Si hay checks automáticos.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Estoy en la misión 01 del Sendero del Caballero. Leé
> senderos/software/README.md y senderos/software/01-elegir-app-e-issue.md.
> Trabajemos como pares: un comando por vez, que lo corro yo, y pedime
> la salida como evidencia. Primero elegir la app, después el issue, y
> ANTES de levantar nada verificar si ya está arreglado. Anotá todo
> en mi bitácora. No postees nada en GitHub por mí. Si fallamos dos
> veces en lo mismo, parate y replanteá.
> ```

## Checkpoint

- [ ] Elegí una app y anoté qué criterios cumple.
- [ ] Elegí un issue que cumple todos los puntos de la lista.
- [ ] Anoté la versión que reporta el issue.
- [ ] Revisé si ya está arreglado (sí o no, con evidencia) y lo anoté.
- [ ] Dejé mi comentario en el issue (lo escribí yo).
- [ ] Leí `CONTRIBUTING.md` y la plantilla de PR, y anoté rama destino y formato de título.

Siguiente: misión 02 — Levantar y reproducir (🔴 pendiente de escribir).
