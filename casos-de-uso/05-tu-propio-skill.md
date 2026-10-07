# 🧭 Caso 05 — Tu propio skill: una tarea con reglas, guardada

**Requiere: Nivel 03 y el [caso 01](01-reporte-recurrente.md).** Tiempo estimado: 30 a 40 minutos.

> [!WARNING]
> **Este caso está en prueba.** Está armado a partir de un skill real que usamos, pero todavía nadie nuevo lo siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md).

## El problema

Hay tareas que repetís y que tienen **reglas**: "antes de mandar el mail, confirmame", "nunca pongas el nombre del cliente", "no inventes números". Si se las explicás de nuevo cada vez, un día el agente se olvida de una. Un **skill** guarda esas reglas en un archivo que el agente lee cada vez que lo necesita. Es como una receta con las advertencias de alergia escritas en la tapa: no depende de que te acuerdes de avisar.

En el caso 01 ya hiciste uno (`generar-reporte`). Acá vemos qué lo hace bueno.

## Las 4 partes de un buen skill

| Parte | Para qué sirve |
|---|---|
| **Nombre y descripción corta** | El agente decide solo cuándo usarlo según esa descripción, o lo llamás vos con `/nombre` |
| **Reglas que nunca se saltea** | Lo que no se negocia: confirmar antes de enviar, no inventar, qué carpeta no tocar |
| **Pasos** | El orden de la tarea, corto y concreto |
| **Qué te entrega** | El formato del resultado, para que siempre sea parecido |

**Dónde vive** (en Claude Code): en `.claude/skills/<nombre>/SKILL.md` dentro de tu proyecto, o en `~/.claude/skills/<nombre>/SKILL.md` para usarlo en todos tus proyectos. Con otro agente, preguntale cuál es el equivalente.

## Un ejemplo real

Una persona de este proyecto tiene un skill, `/miskatronic`, para leer y escribir en un repositorio de conocimiento que comparte con otra persona. Sus reglas:

- Antes de escribir algo, **muestra el texto y espera su sí** en ese mismo mensaje.
- Nunca escribe nombres reales.
- Nunca toca la carpeta de la otra persona.
- Solo mira lo que cambió desde la última vez, en vez de releer todo.

Esas reglas antes se le olvidaban al agente de a ratos. Desde que están en el skill, se cumplen siempre.

## Dos trucos para que sea seguro y se pueda compartir

1. **Tus datos van en un archivo aparte**, local y fuera de git, que el skill lee: tu nombre, tus carpetas, tus direcciones. Así podés pasarle el skill a un compañero sin pasarle tus datos, y él pone los suyos.
2. **Aprobación antes de actuar**: si el skill escribe, envía o publica algo, primero te muestra qué va a hacer y espera tu sí, cada vez.

## Acción — armá el tuyo

Elegí una tarea repetida que tenga al menos una regla importante.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Quiero crear un skill para esta tarea que repito: [la tarea].
> Las reglas que nunca se tienen que saltear son: [reglas, por
> ejemplo "confirmarme antes de enviar" o "no inventar datos"].
> Guardá mis datos personales en un archivo aparte, fuera de git,
> y que el skill lo lea. Mostrame el borrador antes de guardarlo y
> explicame cada parte con palabras simples.
> ```

## Probalo, y probá que frene

Corré el skill con un caso normal. Después hacé la prueba que importa: **pedile algo que rompa una regla** ("mandalo sin preguntarme") y confirmá que frena y te pregunta. Si no frena, la regla no está bien escrita: pedile que la reescriba más fuerte.

## Cuándo NO hacer un skill

- Si la tarea la hacés una sola vez.
- Si no tiene reglas importantes: una frase en tu `CLAUDE.md` o en tu memoria (Nivel 02) alcanza.
- Un skill con demasiadas instrucciones se vuelve difícil de seguir. Mejor corto y claro.

## Checkpoint

- [ ] Elegí una tarea repetida con al menos una regla importante.
- [ ] Mi agente creó el skill y revisé el borrador antes de guardarlo.
- [ ] Mis datos personales están en un archivo aparte, fuera de git.
- [ ] Lo probé con un caso normal y también con uno que rompe una regla, y frenó.
