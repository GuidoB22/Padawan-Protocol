# 🎓 Maestría — Memoria persistente

> Requiere: [Nivel 02 — Memoria persistente](../niveles/02-memoria-persistente.md) ya hecho.

## 1. La versión simple que ya sabés

En el Nivel 02 armaste `memoria.md`: el agente lo lee al empezar y lo actualiza al cerrar, para no "olvidarse" todo entre sesiones. Funciona. Esta sección es sobre **por qué** esa receta tan simple ya resuelve la mayor parte del problema real.

## 2. Por qué funciona así — con evidencia real citada

Hay un paper reciente que se pregunta exactamente esto: qué necesita de verdad un sistema de memoria para que un agente de IA funcione bien a lo largo del tiempo, no solo dentro de una conversación.

> **Pink, Wu, Vo, Turek, Mu, Huth & Toneva — "Position: Episodic Memory is the Missing Piece for Long-Term LLM Agents"** (arXiv:2502.06975, feb. 2025)

> [!NOTE]
> **Nivel de confianza de esta fuente**: es un *position paper* (una propuesta argumentada, no un experimento con resultados medidos) en arXiv, todavía sin pasar por revisión de pares en una conferencia o revista. Dos de los autores (Huth, Turek) tienen trayectoria real en investigación de lenguaje-cerebro en UT Austin, lo que le da más peso que un preprint anónimo — pero seguí tratándolo como "propuesta razonada", no como "está probado".

El paper propone 5 propiedades que un sistema de memoria necesita para que un agente funcione bien a largo plazo:

1. **Almacenamiento que sobrevive a la sesión** — no se pierde cuando cerrás la conversación.
2. **El agente puede razonar sobre lo guardado**, no solo repetirlo — usarlo para decidir, no solo citarlo.
3. **Aprende de una sola vez** — no necesita que le repitas lo mismo 10 veces para que "quede".
4. **Especificidad de instancia** — guarda EL hecho puntual (este dato, de este día, de este caso), no solo una regla general borrosa.
5. **Contexto ligado al contenido** — guarda también quién/cuándo/por qué de cada cosa, no solo el dato pelado.

**Lo interesante**: tu `memoria.md` del Nivel 02, sin que hayas leído este paper, ya cumple las 5 — es la validación retroactiva más convincente que hay (un diseño simple que de forma independiente llega a las mismas 5 propiedades que propone la investigación, en vez de copiarlas de ahí).

| Propiedad del paper | Cómo la cumple tu `memoria.md` |
|---|---|
| Sobrevive a la sesión | Es un archivo en disco — sigue ahí cuando cerrás el agente |
| Razonar sobre lo guardado | El agente lo lee como texto y lo usa para decidir, no solo lo repite |
| Una sola exposición | Lo escribís una vez, el agente no necesita que se lo repitas |
| Especificidad de instancia | Anotás el hecho puntual ("el 12/08 pasó X"), no una regla genérica |
| Contexto ligado | Si anotás fecha + motivo junto al hecho, ya tenés el "por qué" ahí mismo |

## 3. Ejemplo concreto

Dos formas de anotar lo mismo en `memoria.md` — una cumple las 5 propiedades, la otra no:

❌ **Sin contexto ni instancia** (viola propiedades 4 y 5):
```
El usuario prefiere respuestas cortas.
```
Es una regla genérica sin fecha ni motivo — si en 3 meses cambia de opinión, no hay forma de saber si esto sigue vigente o ya quedó viejo.

✅ **Con instancia y contexto** (cumple las 5):
```
[2026-08-20] Pidió explícitamente respuestas más cortas después de que
una respuesta de 40 líneas sobre un bug simple lo frustró. No es una
preferencia general de personalidad — fue puntual a ese tipo de
situación (explicaciones largas de cosas que para él son obvias).
```
Esto te deja razonar DESPUÉS: si en 3 meses el mismo usuario pide algo largo y detallado sobre un tema que SÍ le interesa, sabés que la regla de "corto" no aplica ahí — porque guardaste el motivo, no solo la conclusión.

## 4. Cuándo esto NO aplica

- **Para datos que cambian seguido y se pueden recalcular del código/git**: no los guardes en memoria — memoria es para lo que NO se puede derivar mirando el estado actual (decisiones, contexto, feedback), no para duplicar lo que ya está en otro lado.
- **Para una sesión de un solo uso** (una pregunta puntual, nunca más vas a volver a ese tema): el costo de estructurar bien la instancia+contexto no se paga — guardalo simple, o ni lo guardes.
- **El paper mismo lo dice**: es una propuesta, no un sistema probado en producción a gran escala — si tu memoria.md deja de andar bien en algún caso raro, confiá en lo que observás vos antes que en las 5 propiedades del paper.

## Relaciones

- [[02-memoria-persistente]] (Nivel 02, la versión simple)
- [[06-avanzado-opcional]] (upgrade de memoria.md a un sistema dedicado, cuando este archivo ya te queda chico)
