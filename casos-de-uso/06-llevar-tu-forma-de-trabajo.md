# 🧭 Caso 06 — Llevá tu forma de trabajo a donde vayas

**Requiere: Nivel 03, y haber visto el Nivel 06 (versionar con git).** Tiempo estimado: 40 a 60 minutos.

> [!WARNING]
> **Este caso está en prueba.** Todavía nadie lo siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md).

## El problema

Todo lo que fuiste armando (tu persona, tus skills, tus plantillas, tus formas de trabajar) vive en una carpeta de **tu** compu. Si cambiás de compu o de trabajo, o se rompe el disco, empezás de cero. Es como mudarte y dejar la caja de herramientas en la casa vieja.

La idea: guardar **la parte que se puede llevar**, en un lugar tuyo, sin arrastrar nada sensible.

## Qué llevar y qué NO

| Sí, es portable | No, nunca |
|---|---|
| Tu persona (`CLAUDE.md`) sin datos personales | Claves, tokens y contraseñas |
| Tus skills (caso 05) | Mails, chats y notas de clientes o de tu empresa |
| Plantillas (reportes, notas) | Datos de personas (nombres, teléfonos, legajos) |
| Tus convenciones de etiquetas y carpetas | Memoria con detalles de un trabajo o proyecto puntual |
| Memoria general ("prefiero respuestas cortas") | Cualquier cosa que tu empresa considere confidencial |

> [!WARNING]
> **Lo que armaste con datos o herramientas de tu empresa puede no ser tuyo para llevártelo.** Antes de guardar algo fuera de tu trabajo, fijate qué dice tu contrato o la política de la empresa. Ante la duda, dejalo afuera.

## Paso 1 — Separá lo portable de lo sensible

Armá una carpeta (por ejemplo `portable/`) solo con lo de la columna "Sí". Lo sensible queda afuera y se anota en `.gitignore` para que nunca se suba.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Armá una carpeta portable/ y copiá ahí SOLO lo que se puede llevar
> a otra compu: mi persona, mis skills y mis plantillas. Antes de
> copiar cada archivo, revisalo y sacale cualquier dato personal, de
> clientes o de mi empresa. Mostrame la lista de lo que vas a copiar
> y esperá mi sí.
> ```

## Paso 2 — Un repositorio PRIVADO

Un repositorio en GitHub es una carpeta guardada en internet con historial de cambios. Hacelo **privado** (solo vos lo ves). Desde la página de GitHub: **New repository** y elegí **Private**. Después de crearlo, confirmá que arriba al lado del nombre diga **Private**.

Esta parte la hacés vos con tu cuenta; tu agente te guía pero no debería pedirte la contraseña.

## Paso 3 — Revisá antes de subir

Esta revisión es la más importante. Pedile a tu agente que busque claves, mails, nombres y datos de la empresa en lo que vas a subir, y **leé vos la lista**, porque una revisión automática puede equivocarse.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Antes de subir portable/ a mi repositorio privado, buscá en todos
> los archivos: claves o tokens, direcciones de mail, nombres de
> personas o clientes, y nombres de herramientas o sistemas internos
> de mi empresa. Mostrame cada hallazgo con el archivo y la línea.
> No subas nada hasta que yo lo revise.
> ```

## Paso 4 — Subilo y probá restaurarlo

Pedile a tu agente que lo suba (como en el Nivel 06). Después **probá la mudanza**: en otra carpeta o en otra compu, descargá el repositorio, abrí tu agente ahí y decile que lea tus archivos. Si tu agente se comporta como siempre, funciona.

## Opcional — Compartirlo públicamente

Si algún día querés mostrar tu forma de trabajar, podés hacer **público** solo un repositorio aparte con la parte limpia. Eso es una decisión grande: una vez público, cualquiera lo ve y puede copiarlo. Hacelo solo después de la revisión del Paso 3, y empezá siempre por privado.

## Checkpoint

- [ ] Tengo una carpeta `portable/` con solo lo que se puede llevar.
- [ ] Revisé qué dice mi empresa sobre llevarme lo que armé.
- [ ] El repositorio está en GitHub y dice **Private**.
- [ ] Leí yo mismo la lista de hallazgos antes de subir.
- [ ] Probé restaurarlo en otra carpeta o compu.
