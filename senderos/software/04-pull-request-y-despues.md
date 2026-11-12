# 🧭 Misión 04 — Pull request y después

**Requiere: el checkpoint de la [misión 03](03-causa-y-fix.md).**

> [!WARNING]
> **Esta misión está en prueba.** Sale de un ejercicio real, pero todavía nadie nuevo la siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../../COMO-PEDIR-AYUDA.md).

## Lo que vas a lograr

Un commit limpio en la rama correcta, un pull request abierto con descripción honesta y los checks mirados, y el cierre del ejercicio: comentario en el issue, feedback atendido y entorno limpio.

Todo lo que se publica (push, PR, comentarios) lo hacés **vos**. Tu agente prepara y revisa; no publica.

## Rama y commit

- **Rama destino correcta**, según lo que anotaste de `CONTRIBUTING` en la misión 01.
- 🔴 **Usá un worktree si tenés que cambiar de rama.** Cambiar de rama en la carpeta que sirve Docker cambia el código que corre la app y puede romper el entorno (por ejemplo, código de una versión contra una base de datos de otra). Un worktree es otra carpeta con otra rama:

```
git worktree add -b nombre-de-la-rama ../repo-RAMA origin/RAMA
git cherry-pick SHA_DEL_COMMIT
```

- **Agregá archivos por nombre**, nunca `git add -A` ni `git add .`:

```
git add ruta/del/archivo
git status -sb
git diff --stat
```

- **Revertí los parches de entorno** que no son parte del fix: `git restore ruta/del/archivo`.
- No incluyas archivos ajenos (herramientas, notas, carpetas de otros programas).
- Mensaje de commit con la convención del proyecto.
- No agregues líneas de atribución que el proyecto no usa.

**Checkpoint parcial:** `git diff --stat` muestra solo los archivos esperados y el número de líneas esperado.

## Abrir el pull request

### Preparar

1. Creá el fork (en la web: botón Fork; si pide "copy only the default branch" da igual, el PR se compara contra el repo original).
2. Conectá y subí:

```
git remote add fork https://github.com/TU_USUARIO/REPO.git
git push -u fork nombre-de-la-rama
```

3. Verificá que GitHub vea el cambio como esperás:

```
gh api "repos/OWNER/REPO/compare/RAMA_BASE...TU_USUARIO:nombre-de-la-rama" --jq '"ahead_by=\(.ahead_by) behind_by=\(.behind_by) archivos=\([.files[].filename] | join(","))"'
```

Esperado: 1 commit adelante, 0 atrás, solo tus archivos.

4. Abrí la página de comparar con título y descripción precargados: `https://github.com/OWNER/REPO/compare/BASE...USUARIO:REPO:RAMA?expand=1&title=...&body=...` (texto codificado para URL).

### Antes de apretar "Create pull request"

- ✅ Base correcta (la rama de las reglas del proyecto).
- ✅ Título con el formato que pide la plantilla.
- ✅ Descripción corta, menos de 300 palabras.
- ✅ **No cerrar un issue por error:** `Fixes #123`, `Closes #123` y `FIX #123` en el título **cierran** el issue al mergear. Si tu PR no lo resuelve (porque ya estaba arreglado o es un caso distinto), usá `Related to #123`.
- ✅ Nada interno: sin referencias a tus notas, repos privados o jerga propia.
- ✅ Capturas si el PR cambia la interfaz.

### Plantilla de descripción

```
# <Título con el formato que pide el proyecto: qué se arregla, en una línea>

<Qué estaba pasando y por qué, 2-4 líneas.>

<Qué cambia este PR, 1-2 líneas.>

**Limitations**
- <Lo que NO cubre o no pudiste probar. Ser honesto aquí suma credibilidad.>

**How to verify**
- <Antes: qué falla. Después: qué funciona. Con comandos o pasos.>
```

### Después de crearlo

```
gh pr checks NUMERO --repo OWNER/REPO
gh pr view NUMERO --repo OWNER/REPO
```

Esperá los checks automáticos. Un check de "título, descripción y rama" en verde es la primera aprobación de forma.

**Evidencia a guardar:** el link del PR, los checks y las capturas.

## Después del PR

- Dejá un **comentario útil en el issue** con lo que descubriste (causa, versión donde está arreglado, enlace al PR). Lo escribís y lo posteás vos.
- **Atendé el feedback** de los mantenedores: respuesta corta, concreta, y con cambios en la misma rama.
- **Limpiá el entorno** cuando ya no haga falta:

```
docker compose -f docker-compose.yml -f OTRO_ARCHIVO.yml down -v
```

`-v` borra también la base de datos de prueba: usalo solo cuando ya no necesites los datos.

- **No borres el worktree** hasta que el PR esté cerrado o mergeado: ahí se hacen los cambios que pidan.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Estoy en la misión 04 del Sendero del Caballero. Leé
> senderos/software/README.md y senderos/software/04-pull-request-y-despues.md.
> Trabajemos como pares: un comando por vez, que lo corro yo. Vos
> NUNCA hacés push, ni abrís el PR, ni posteás comentarios: eso lo
> hago yo. Ayudame a revisar el diff, a redactar la descripción con
> la plantilla y a recorrer la lista previa a crear el PR. En cada
> checkpoint pedime evidencia y verificala. Anotá todo en la
> bitácora. Si fallamos dos veces en lo mismo, parate y replanteá.
> ```

## Checkpoint

- [ ] `git diff --stat` muestra solo los archivos esperados, en la rama correcta, sin parches de entorno.
- [ ] La comparación con la API muestra 1 commit adelante, 0 atrás y solo mis archivos.
- [ ] Repasé la lista previa a crear el PR (base, título, descripción, `Related to` si corresponde, nada interno, capturas).
- [ ] Abrí el PR yo mismo y guardé el link, los checks y las capturas en la bitácora.
- [ ] Dejé en el issue un comentario útil, escrito por mí.
- [ ] Sé qué hacer con el feedback, y el worktree se queda hasta que el PR cierre.
- [ ] Limpié el entorno, o lo dejé a propósito hasta que el PR cierre.

Eso cierra el sendero. Volvé al [README del sendero](README.md).
