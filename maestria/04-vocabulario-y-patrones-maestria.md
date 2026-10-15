---
tema: vocabulario-y-patrones
última-actualización: 2026-10-14
---

# 🎓 Maestría — Vocabulario y patrones

> Requiere: [Nivel 04 — Vocabulario y patrones](../niveles/04-vocabulario-y-patrones.md) ya hecho.

## 1. La versión simple que ya sabés

En el Nivel 04 aprendiste cuatro palabras: **rama** (un tema con su backlog), **WIP = 1** (una sola tarea activa por rama), **freno de mano** (el agente para y te pregunta) y **día de análisis** (releer todo lo juntado en vez de sumar cosas nuevas). Funcionan. Esta sección es sobre **por qué** tres de ellas no son una cuestión de gusto, sino respuestas a problemas medidos o argumentados en serio.

## 2. Por qué funciona así — con evidencia real citada

Hay una fuente para cada patrón. La rama se explica junto con WIP = 1, porque es lo mismo visto desde otro lado.

### WIP = 1 (y la rama) — Rubinstein, Meyer & Evans

> **Rubinstein, Meyer & Evans — "Executive Control of Cognitive Processes in Task Switching"** (Journal of Experimental Psychology: Human Perception and Performance, 27(4), 763-797, 2001 — DOI: 10.1037/0096-1523.27.4.763)

> [!NOTE]
> **Nivel de confianza de esta fuente**: artículo de revista con revisión de pares (APA), con cuatro experimentos controlados y muy citado. Dos límites: es sobre **personas** cambiando entre tareas cortas de laboratorio (clasificar figuras, hacer cuentas), no sobre agentes ni sobre proyectos de semanas; y el modelo de "etapas" que proponen para explicar el costo fue discutido después por otros trabajos. Lo que nadie discute es el dato base: cambiar de tarea cuesta tiempo.

En los experimentos, la gente alternaba entre dos tareas o repetía siempre la misma. Tres hallazgos:

1. **Cambiar de tarea cuesta tiempo**, siempre — comparado con repetir la misma.
2. **El costo crece con la complejidad** de las reglas de la tarea y cuando se pasa de una tarea conocida a una desconocida.
3. **El costo baja cuando hay una señal clara** de cuál es la tarea que toca ahora.

Los autores lo explican con dos pasos que tu cabeza hace en cada cambio: **cambiar de objetivo** ("ahora estoy en esto") y **activar las reglas** de la tarea nueva ("acá se trabaja así").

Traducido a tu trabajo con el agente:

| Hallazgo del paper | Patrón del Nivel 04 que lo ataca |
|---|---|
| Cada cambio de tarea cuesta tiempo | **WIP = 1**: menos cambios, menos costo pagado |
| El costo crece con tareas complejas | Las tareas reales con tu agente son mucho más complejas que las del laboratorio — razón de más para no alternar |
| Una señal clara baja el costo | **Rama** con nombre y backlog anotado: cuando volvés, la lista te dice "estás en esto, seguía aquello" |

La analogía tiene un límite honesto: el paper mide milisegundos en tareas de laboratorio, no horas en proyectos. Lo que se transfiere es la **dirección** del efecto (cambiar cuesta, y cuesta más cuanto más complejo es lo que cambiás), no el número.

### Freno de mano — Mitchell, Ghosh, Luccioni & Pistilli

> **Mitchell, Ghosh, Luccioni & Pistilli — "Fully Autonomous AI Agents Should Not be Developed"** (arXiv:2502.02649, feb. 2025, revisado oct. 2025)

> [!NOTE]
> **Nivel de confianza de esta fuente**: es un *position paper* (argumento razonado, no experimento con resultados medidos) en arXiv, sin revisión de pares confirmada. Las cuatro autoras trabajan en Hugging Face y tienen trayectoria reconocida en ética de IA, lo que le da peso — pero tratalo como "propuesta argumentada", igual que el paper del Nivel 02 de Maestría.

La idea central del paper: **los riesgos para las personas crecen con la autonomía del sistema** — cuanto más control le cedés al agente, más puede salir mal sin que nadie lo frene. Por eso proponen no construir agentes completamente autónomos y quedarse en sistemas semiautónomos, donde una persona conserva el control de las decisiones que importan.

El freno de mano es exactamente eso, en chiquito: no le sacás autonomía al agente para todo (sería lentísimo), se la sacás **solo** donde el riesgo es alto — lo irreversible y lo que solo vos podés decidir. El resto del tiempo sigue solo.

### Día de análisis — Park et al. (Generative Agents)

> **Park, O'Brien, Cai, Morris, Liang & Bernstein — "Generative Agents: Interactive Simulacra of Human Behavior"** (UIST 2023, ACM — preprint: arXiv:2304.03442)

> [!NOTE]
> **Nivel de confianza de esta fuente**: paper publicado en UIST 2023 (conferencia de interacción humano-computadora con revisión de pares) y muy citado. Ojo con el alcance: lo que se midió es qué tan "creíble" es el comportamiento de 25 personajes simulados en un pueblo virtual, no qué tan bien un agente te ayuda a vos con tu trabajo — la analogía con tu día de análisis es de diseño, no un experimento sobre tu caso.

Los agentes del paper guardan todo lo que les pasa en una lista larga de recuerdos. Pero además, cada tanto, hacen una **reflexión**: releen sus recuerdos recientes y escriben conclusiones de más alto nivel ("Klaus está muy dedicado a su investigación"), que vuelven a guardar junto con los recuerdos. Esas conclusiones después guían lo que el agente planea hacer.

**El resultado que importa para vos**: los autores probaron sacar cada pieza del sistema (un *ablation*), y encontraron que observar, planificar y **reflexionar** contribuyen cada una de forma crítica a que el comportamiento sea creíble. Sin reflexión, el agente tiene todos los datos pero no saca nada de ellos.

| Diseño de Generative Agents | Tu día de análisis |
|---|---|
| Lista de recuerdos que solo crece | Tu segundo cerebro y tu `memoria.md` |
| Reflexión periódica sobre lo guardado | El día de análisis (una vez por semana, por ejemplo) |
| Conclusiones nuevas guardadas junto a los datos | Lo que encontrás (contradicciones, cosas viejas, conexiones) queda anotado |

## 3. Ejemplo concreto

Tenés una rama "finanzas" con su backlog, y a mitad de una tarea se te ocurre otra cosa. Dos formas de pedírselo al agente:

❌ **Sin rama ni WIP, sin freno** (paga el costo de cambio y cede control de más):
```
Ah, y de paso comparame los planes de celular y contratá el más barato.
```
El agente deja la tarea de finanzas a medias (cambio de tarea), arranca algo nuevo sin anotarlo en ningún backlog (no hay señal para volver después), y "contratá" es una acción irreversible que le cediste sin darte cuenta.

✅ **Con rama, WIP = 1 y freno de mano**:
```
Anotá en el backlog de "finanzas": comparar planes de celular. No lo
arranques — seguimos con el presupuesto, que es el ítem en curso.
Cuando lleguemos a ese ítem, comparás y me mostrás; contratar lo decido yo.
```
La tarea activa sigue siendo una (WIP = 1), la idea nueva quedó anotada en la rama (la señal clara para volver sin perder el hilo) y la contratación tiene freno de mano (el riesgo alto queda de tu lado). Y el viernes, en el día de análisis, el agente puede notar que "comparar planes" lleva tres semanas esperando y preguntarte si sigue vigente.

## 4. Cuándo esto NO aplica

- **WIP = 1 cuando estás bloqueado esperando a alguien**: si la tarea en curso depende de una respuesta que tarda días, pausarla a propósito ("esto queda esperando") y tomar otra no rompe la regla — lo que rompe la regla es tener varias abiertas *sin decirlo*.
- **Tareas triviales**: el costo de cambio que mide el paper importa con tareas complejas. Si en medio de algo le pedís al agente "¿qué hora es en Tokio?", no hace falta abrir una rama ni anotarlo en un backlog.
- **Frenos de mano en todo**: si ponés freno en cada paso, el agente te pregunta tanto que dejás de leer lo que te pregunta, y el freno deja de proteger. El paper de Mitchell et al. habla de *ceder control* en lo riesgoso, no de supervisar cada acción. Reservalos para lo irreversible y lo que es tuyo de verdad.
- **Día de análisis con poco material**: si tu segundo cerebro tiene una docena de notas, no hay mucho para reflexionar. El beneficio aparece cuando lo juntado ya no entra cómodo en tu cabeza.
- **Los papers no son sobre vos**: uno mide personas en laboratorio, otro argumenta sin medir, el tercero mide personajes simulados. Si un patrón no te funciona en tu caso, confiá en lo que observás vos.

## Relaciones

- [[04-vocabulario-y-patrones]] (Nivel 04, la versión simple)
- [[02-memoria-persistente-maestria]] (lo que el día de análisis relee)
- [[03-segundo-cerebro-maestria]] (el vault que el día de análisis ordena)
