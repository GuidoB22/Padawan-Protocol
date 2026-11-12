# 🧭 Caso real: el ejercicio del que salió este sendero

> [!WARNING]
> **Este anexo está en prueba.** Cuenta un ejercicio real, pero el sendero todavía no lo siguió de punta a punta nadie nuevo. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../../COMO-PEDIR-AYUDA.md).

Las misiones explican cada lección de forma genérica. Acá está el caso concreto del que salieron, con los nombres reales. No es una misión: no hace falta para hacer el sendero.

## Qué fue el ejercicio

Quien aprendía y quien guiaba trabajaron juntos en el proyecto open source **Dolibarr**. El objetivo era el mismo que el del sendero: levantarlo, reproducir un error real, encontrar la causa, proponer un fix y abrir un pull request, con evidencia en cada paso.

El bug elegido fue el **issue #42911**. El resultado fueron dos pull requests.

## Qué pasó, misión por misión

**Misión 01: elegir app e issue**
- El primer intento fue un issue con una lista de cambios sugeridos sobre un `pom.xml`. Se descartó: una sugerencia ya estaba hecha, tres eran por diseño y no hacía falta correr la app.
- En el issue elegido después, el reporter usaba la versión 24.0.2 y el bug ya estaba corregido en la 24.0.3, un día antes de abrirse el issue. Se perdieron horas reproduciendo algo ya resuelto.
- Dolibarr pide apuntar a la rama de la versión más antigua donde existe el bug, y titular con `FIX` en mayúscula para que entre al ChangeLog. Estuvo cerca de mandarse el PR a la rama equivocada.

**Misión 02: levantar y reproducir**
- El README decía `dev/build/docker` y la carpeta real era `dev/build/docker-dev`.
- El primer `compose up` falló: la imagen base era Debian 11 y sus paquetes ya no se publicaban. Se cambió a Debian 12 solo en local, para poder trabajar, y se revirtió antes de commitear. Después se reportó como su propio PR.
- La app quedó en `http://localhost:8082`. En el instalador se puso `localhost` como servidor de base de datos; dentro de Docker tenía que ser el nombre del servicio (`mariadb`).
- La pestaña "RRHH y banco" no aparecía: hacía falta el módulo activo y el permiso correspondiente. Ser administrador no alcanzaba.
- Una pantalla de "acceso denegado" pesó 7 KB; el formulario normal, 21 KB. Esa diferencia sirvió de señal al reproducir.

**Misión 03: causa y fix**
- `git show` sobre un commit de seguridad de agosto reveló el chequeo que rechazaba la edición, y otro commit de octubre, de una sola línea, lo había corregido.
- La clase de cuentas bancarias de empresa ya guardaba la entidad al crear; la de usuarios no. Copiar el estilo de la hermana fue la solución más estándar.
- El fix se probó con un caso simulado, no con el escenario original del reporter.

**Misión 04: pull request**
- Cambiar de rama en la carpeta que servía Docker hubiera roto el entorno. La forma de evitarlo es un worktree.
- `FIX #n` en el título habría cerrado un issue que ya había resuelto otra persona. La forma de evitarlo es `Related to #n`.

## Los 11 errores, y dónde está la lección

| # | Qué pasó | Cómo evitarlo | Misión |
|---|---|---|---|
| 1 | El primer issue era una lista de sugerencias y no requería correr la app | Aplicar la checklist de elegir el issue | [01](01-elegir-app-e-issue.md) |
| 2 | Reprodujimos un bug que ya estaba corregido en una versión nueva | Revisar versión del reporter e historial antes de levantar nada | [01](01-elegir-app-e-issue.md) |
| 3 | El README apuntaba a una carpeta que no existía | Verificar rutas antes de ejecutar | [02](02-levantar-y-reproducir.md) |
| 4 | La imagen base de Debian ya no tenía paquetes y el build fallaba | Leer los logs desde el final; reportar como PR aparte | [02](02-levantar-y-reproducir.md) |
| 5 | Pusimos `localhost` como servidor de base de datos | Usar el nombre del servicio en Docker | [02](02-levantar-y-reproducir.md) |
| 6 | La pestaña no aparecía por falta de módulo y permiso | Buscar en el código la condición que la muestra | [02](02-levantar-y-reproducir.md) |
| 7 | Un fix probado solo con un caso simulado | Decirlo en la sección Limitations del PR | [03](03-causa-y-fix.md) y [04](04-pull-request-y-despues.md) |
| 8 | Casi mandamos el PR a la rama equivocada | Leer `CONTRIBUTING` y la plantilla de PR primero | [01](01-elegir-app-e-issue.md) y [04](04-pull-request-y-despues.md) |
| 9 | `FIX #n` en el título habría cerrado un issue ya resuelto por otro | `Related to #n` cuando no corresponde cerrar | [04](04-pull-request-y-despues.md) |
| 10 | Cambiar de rama hubiera roto el entorno Docker | Usar un worktree | [04](04-pull-request-y-despues.md) |
| 11 | Git Bash convirtió una ruta de Linux | `MSYS_NO_PATHCONV=1` | [02](02-levantar-y-reproducir.md) |

Volvé al [README del sendero](README.md).
