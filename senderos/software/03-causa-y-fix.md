# 🧭 Misión 03 — Encontrar la causa y probar el fix

**Requiere: el checkpoint de la [misión 02](02-levantar-y-reproducir.md).**

> [!WARNING]
> **Esta misión está en prueba.** Sale de un ejercicio real, pero todavía nadie nuevo la siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../../COMO-PEDIR-AYUDA.md).

## Lo que vas a lograr

Una cadena causal escrita con archivo y línea, un fix chico diseñado con plan de tres líneas, y pruebas con evidencia de que funciona sin romper nada.

## Encontrar la causa

De la pantalla al código:

1. Buscá el mensaje o la función que produce el síntoma (`rg "mensaje_de_error" ruta/`, o con el editor).
2. Leé la condición completa.
3. Preguntate: **¿quién escribe este valor? ¿quién lo lee? ¿qué cambió y cuándo?**
4. Usá el historial como aliado:

```
git log --oneline -8 -- ruta/del/archivo
git blame -L 100,110 ruta/del/archivo
git show SHA
```

🔴 **Lección:** `git show` sobre un commit de seguridad reciente reveló el chequeo que rechazaba la edición, y otro commit posterior, de una sola línea, ya lo había corregido para otro caso.

### Experimentos para probar una hipótesis

Todos tienen que ser **reversibles** y estar **marcados**:

- **Quitar o comentar una línea temporalmente** con una marca como `TEMP-EXPERIMENT`. Antes de commitear, comprobá que no queda ninguna (`rg TEMP-EXPERIMENT`).
- **Control A/B:** la misma prueba sin el fix y con el fix. Si cambia el resultado, el fix es la causa.
- **Simular datos con SQL** (ej. poner un valor distinto en una columna) para forzar el caso que no sabés reproducir:

```
docker exec CONTENEDOR_DB mariadb -uroot -pCLAVE BASE -e "SELECT ..."
```

- **Script descartable fuera del repo**, copiado al contenedor, que ejecuta la función y limpia lo que creó:

```
docker cp mi_prueba.php CONTENEDOR_WEB:/tmp/mi_prueba.php
docker exec CONTENEDOR_WEB php /tmp/mi_prueba.php
```

Anotá la **cadena causal** con evidencia: A produce B, B produce C, y se ve en tal línea de tal archivo. Marcá 🔴 lo que no pudiste verificar.

**Checkpoint parcial:** una cadena causal escrita, con archivo y línea para cada eslabón.

## Diseñar el fix

Antes de editar, escribí tres líneas:

- **Qué cubre:** el escenario exacto que se arregla.
- **Qué archivo toca:** el menor número posible.
- **Cómo se verifica:** el comando o la pantalla que lo demuestra.

### No reinventar la rueda

Buscá cómo lo resuelve el propio proyecto:

```
rg "palabra_clave_del_patron" ruta/
```

Mirá las clases hermanas. 🔴 **Lección:** una clase hermana ya guardaba cierto dato al crear el registro; la que fallaba, no. Copiar el estilo de la hermana fue la solución más estándar.

### Arreglar el origen, no el síntoma

Si un chequeo rechaza datos "mal guardados", la pregunta es si el chequeo es incorrecto o si el dato nace mal. Arreglar donde nace el dato suele ser más chico y más correcto.

### Preguntas antes de escribir

- ¿El arreglo cubre el escenario real del reporter, o solo uno que simulé?
- ¿Qué pasa con los datos que ya existen? Si no se arreglan, decilo en el PR.
- ¿Hay una alternativa más simple? Si hay más de una opción con tradeoffs reales, anotalas con pros y contras antes de decidir.

**Checkpoint parcial:** plan de tres líneas y decisión tomada, con la razón anotada.

## Probar el fix

Tres tipos de prueba, todas con evidencia:

1. **Control A/B:** sin el fix falla, con el fix funciona (mismo script, mismo caso).
2. **Regresión:** los flujos normales siguen andando (crear, editar y borrar, no solo el caso del bug). Revisá los logs: sin errores del lenguaje.
3. **Seguridad:** si el área tiene permisos, probá con un **usuario sin permisos** y confirmá que sigue rechazado. Un fix no debe abrir acceso de más.

Además, el chequeo de sintaxis del lenguaje (ej. `php -l archivo.php`).

Limpiá los datos de simulación: volvé a poner el valor original en la base.

**Evidencia a guardar:** tabla con cada prueba, el resultado y la fuente (log, captura o salida de comando), en la sección Evidencia de la bitácora.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Estoy en la misión 03 del Sendero del Caballero. Leé
> senderos/software/README.md y senderos/software/03-causa-y-fix.md.
> Trabajemos como pares: un comando por vez, que lo corro yo. Ayudame
> a buscar la causa con historial y experimentos reversibles y
> marcados, y pedime la cadena causal con archivo y línea. Antes de
> editar, exigime el plan de tres líneas. No aceptes un parche que yo
> no entienda. Verificá cada prueba con evidencia. Anotá todo en la
> bitácora. Si fallamos dos veces en lo mismo, parate y replanteá.
> ```

## Checkpoint

- [ ] Tengo una cadena causal escrita, con archivo y línea en cada eslabón, y lo no verificado marcado 🔴.
- [ ] Todo experimento temporal está revertido y `rg TEMP-EXPERIMENT` no devuelve nada.
- [ ] Tengo el plan de tres líneas (qué cubre, qué archivo toca, cómo se verifica) y la decisión con su razón.
- [ ] Probé con control A/B, regresión y, si aplica, seguridad con un usuario sin permisos.
- [ ] Pasó el chequeo de sintaxis del lenguaje.
- [ ] Limpié los datos de simulación.
- [ ] La tabla de evidencia está completa en la bitácora.

Siguiente: [misión 04 — Pull request y después](04-pull-request-y-despues.md).
