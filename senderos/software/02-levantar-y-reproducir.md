# 🧭 Misión 02 — Levantar la app y reproducir el error

**Requiere: el checkpoint de la [misión 01](01-elegir-app-e-issue.md).**

> [!WARNING]
> **Esta misión está en prueba.** Sale de un ejercicio real, pero todavía nadie nuevo la siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../../COMO-PEDIR-AYUDA.md).

## Lo que vas a lograr

Clonar el proyecto, levantarlo, instalarlo y **ver el error con tus ojos**, sin tocar una línea de código. Si no se reproduce, llegás a una conclusión argumentada de por qué.

## Clonar y levantar

```
git clone https://github.com/OWNER/REPO.git
cd REPO
git switch RAMA
```

Leé el `README` **con desconfianza**: comprobá que las carpetas y los comandos que menciona existen de verdad.

🔴 **Lección:** nos pasó que el README apuntaba a una carpeta que ya no existía con ese nombre; la real tenía otro. Verificá las rutas antes de ejecutar.

Leé el `docker-compose.yml` antes de correrlo: servicios, puertos expuestos, variables y contraseñas por defecto, volúmenes.

Levantá en una terminal que quede **dedicada** a los logs:

```
docker compose -f docker-compose.yml -f OTRO_ARCHIVO.yml up --build
```

### Cómo leer un fallo

Leé los logs **desde el final hacia arriba** y buscá la primera línea que empiece con `E:`, `ERROR` o `failed`. Lo de arriba suele ser ruido.

| Síntoma | Causa probable | Acción |
|---|---|---|
| `E: Failed to fetch ... 404 Not Found` durante `apt-get` | La imagen base es una versión vieja de una distribución, y sus paquetes ya no se publican | Cambiar la imagen base a la versión vigente y reportarlo como PR aparte |
| Puerto ocupado | Otro programa usa ese puerto | Cambiar la variable del puerto o liberar el puerto |
| `Could not open input file: C:/Program Files/Git/...` en Git Bash | Git Bash convierte rutas de Linux a rutas de Windows | Anteponer `MSYS_NO_PATHCONV=1` al comando |
| Warning de una extensión (ej. `xdebug.so`) con el servidor arrancando igual | Aviso inofensivo | Anotarlo y seguir; no frena nada |

🔴 **Lección:** nuestro primer `compose up` falló por una imagen base cuyos paquetes ya no existían. La cambiamos **solo en local** para poder trabajar, y la revertimos antes de commitear porque no era parte del fix. Después la reportamos como su propio PR.

Regla 4: si el mismo error sobrevive a dos arreglos, parar y releer el log completo.

**Evidencia a guardar:** la salida que muestra el servidor "ready" (web y base de datos).

## Instalar y configurar

Abrí la dirección y el puerto que declara el compose y seguí el instalador web.

Dos puntos donde se tropieza:

- 🔴 El servidor de base de datos **no es `localhost`**: dentro de Docker se llama como el servicio (ej. `mariadb`). `localhost` apunta al propio contenedor web, que no tiene base de datos.
- Anotá usuario y contraseña de administrador que se creen.

Si el instalador pide esperar, no recargues la página.

### Activar lo que haga falta para ver la pantalla del issue

🔴 **Lección:** nos pasó que una pestaña no aparecía. Había que cumplir **dos condiciones**: tener el módulo activo **y** tener el permiso correspondiente. Ser administrador no otorga automáticamente los permisos de cada módulo.

Método para este tipo de bloqueos: buscá en el código la condición que muestra esa pantalla o pestaña, leela y cumplila, en vez de adivinar con clics.

**Checkpoint parcial:** estás logueado en el panel y podés abrir la pantalla donde ocurre el bug.

## Reproducir el error (sin tocar código)

1. Seguí los pasos del issue **al pie de la letra**.
2. En otra terminal, mirá los logs mientras hacés clic:

```
docker logs NOMBRE_DEL_CONTENEDOR --since 5m
```

En PowerShell, para filtrar:

```
docker logs NOMBRE_DEL_CONTENEDOR --since 5m | Select-String "palabra"
```

3. Capturá la pantalla del error y copiá la línea de log.

Truco que nos sirvió: el **tamaño de la respuesta** es una señal. Una pantalla de "acceso denegado" pesó mucho menos que el formulario normal.

### Si no se reproduce

No te rindas ni inventes. Cambiá **una condición por vez** y anotá el resultado:

| Qué variar | Ejemplo |
|---|---|
| Datos | Probar con el registro propio y con el de otro usuario |
| Permisos | Con administrador y con un usuario sin permisos |
| Versión | La del reporter, no solo la última (el bug puede ya estar arreglado) |
| Entorno | Una sola organización vs varias (multi-entidad) |

Registrá cada intento en la tabla de hipótesis de la bitácora: qué probaste, qué viste, qué descartás.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Estoy en la misión 02 del Sendero del Caballero. Leé
> senderos/software/README.md y senderos/software/02-levantar-y-reproducir.md.
> Trabajemos como pares: un comando por vez, que lo corro yo. Antes de
> correr el compose, leé conmigo el docker-compose.yml y marcame
> puertos, contraseñas por defecto y volúmenes. Si algo falla, leé el
> log desde el final. No toques código del proyecto. En cada
> checkpoint pedime evidencia y verificala. Anotá todo en la
> bitácora. Si fallamos dos veces en lo mismo, parate y replanteá.
> ```

## Checkpoint

- [ ] El proyecto está clonado y en la rama correcta.
- [ ] Leí el README y el compose con desconfianza, y verifiqué que los comandos y rutas existen.
- [ ] Tengo la salida con el servidor "ready" como evidencia.
- [ ] Instalé la app y estoy logueado en el panel.
- [ ] Reproduje el error con captura y línea de log, **o** tengo una conclusión argumentada de por qué no se reproduce (y verifiqué si ya estaba arreglado).
- [ ] Mi tabla de hipótesis está al día en la bitácora.

Siguiente: [misión 03 — Causa y fix](03-causa-y-fix.md).
