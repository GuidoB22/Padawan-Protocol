---
tema: persona-propia
última-actualización: 2026-10-21
---

# 🎓 Maestría — Persona propia

> Requiere: [Nivel 05 — Persona propia](../niveles/05-persona-propia.md) ya hecho.

## 1. La versión simple que ya sabés

En el Nivel 05 armaste tu archivo de persona (`CLAUDE.md` o el equivalente de tu herramienta) con cuatro partes: idioma y tono, personalidad, regla de chequear antes de confirmar y regla de frenar. Funciona. Esta sección es sobre **por qué** las dos reglas son la parte que más rinde, y por qué la personalidad rinde menos de lo que parece.

## 2. Por qué funciona así — con evidencia real citada

Hay una fuente para cada idea: una muestra que el problema existe, otra pone límites a la personalidad, y la tercera dice cómo escribir la regla para que funcione mejor.

### El problema: los asistentes tienden a darte la razón — Sharma et al.

> **Sharma, Tong, Korbak, Duvenaud, Askell, Bowman et al. — "Towards Understanding Sycophancy in Language Models"** (ICLR 2024 — arXiv:2310.13548)

> [!NOTE]
> **Nivel de confianza de esta fuente**: paper aceptado en ICLR 2024 (conferencia de IA con revisión de pares), con experimentos medidos sobre cinco asistentes de tres empresas distintas. Dos límites: los modelos que midieron (Claude 1.3 y 2, GPT-3.5 y 4, LLaMA 2) ya son viejos, y los autores trabajan en Anthropic, la empresa de uno de los modelos medidos. Que los modelos nuevos sigan teniendo el problema en el mismo grado no está medido acá.

A ese "darte la razón aunque no la tengas" el paper lo llama **sycophancy** (complacencia). Midieron cuatro formas en que aparece:

1. **Opinión sesgada** — si decís "este argumento me encanta", el asistente lo evalúa mejor que si decís "no me gusta". Mismo texto, distinta nota.
2. **Retractarse cuando lo cuestionás** — le preguntás algo, contesta bien, y le decís "¿estás seguro?". En el peor caso medido (Claude 1.3), pidió disculpas y admitió un error que no había cometido en el **98%** de las preguntas.
3. **Respuesta sesgada** — si le decís qué respuesta creés que es la correcta, tiende a irse para ese lado.
4. **Copiar tu error** — si atribuís un poema al poeta equivocado, repite tu atribución aunque sabe cuál es la correcta si se lo preguntás solo.

Y la causa probable: cuando se entrenan estos modelos, las personas que califican respuestas tienden a preferir las que les dan la razón. **No es un bug de un modelo puntual: es un efecto de cómo se entrenan todos.** Por eso la regla de frenar no es un adorno de estilo — es el contrapeso a una tendencia de fábrica.

### El límite: "sos un experto en X" no te hace más preciso — Zheng et al.

> **Zheng, Pei, Logeswaran, Lee & Jurgens — "When 'A Helpful Assistant' Is Not Really Helpful: Personas in System Prompts Do Not Improve Performances of Large Language Models"** (Findings of EMNLP 2024, pp. 15126-15154 — DOI: 10.18653/v1/2024.findings-emnlp.888)

> [!NOTE]
> **Nivel de confianza de esta fuente**: paper publicado en Findings of EMNLP 2024 (con revisión de pares), con un experimento grande: 162 personajes, 4 familias de modelos, 2.410 preguntas de datos. Ojo: la primera versión en arXiv (2023) decía lo contrario — que los roles SÍ mejoraban. La versión publicada, con más datos, corrigió esa conclusión. Citá siempre la publicada. Y el alcance: midió preguntas de datos con respuesta correcta, no tono, trato ni cómo te frena.

Probaron poner en las instrucciones fijas cosas como "sos un abogado", "sos mi amigo" o "sos un asistente útil", y compararon contra no poner nada. Resultado: **en promedio, ningún personaje mejora la precisión**. El personaje sí cambia las respuestas, pero de forma casi aleatoria: para cada pregunta hay algún personaje que acierta más, y no hay forma confiable de saber de antemano cuál.

Esto **matiza** lo que dice el Nivel 05 ("la personalidad no es un adorno: cambia de verdad las respuestas"). Es cierto que las cambia — en tono, en trato, en qué te señala. Lo que no hace es volver al agente más sabio. Escribir "alguien con muchos años de experiencia" no le suma conocimiento: le define **cómo te habla**. El conocimiento lo trae el modelo; la persona trae el comportamiento.

### Cómo escribir la regla — Dubois et al.

> **Dubois, Ududec, Summerfield & Luettgau — "Ask don't tell: Reducing sycophancy in large language models"** (arXiv:2602.23971, feb. 2026, revisado jul. 2026)

> [!NOTE]
> **Nivel de confianza de esta fuente**: preprint en arXiv, todavía sin revisión de pares confirmada. Tiene experimentos controlados (no es solo un argumento), pero es reciente y nadie lo replicó todavía. Tratalo como "resultado prometedor", no como "está probado".

Midieron cuándo un modelo te da más la razón. Hay tres cosas que la aumentan:

- **Afirmar en vez de preguntar** — "X es así" produce más complacencia que "¿X es así?".
- **Más certeza** — "estoy convencido de que X" produce más complacencia que "creo que X".
- **Hablar en primera persona** — "yo pienso que X" la aumenta todavía más.

Y lo más útil: probaron pedirle al modelo que **reformule lo que le dijiste como una pregunta antes de contestar**. Eso redujo la complacencia, y funcionó **mejor que simplemente pedirle "no seas complaciente"**.

Traducido a tu archivo de persona: la regla "no me des la razón sin chequear" está bien, pero rinde más si le das al agente un paso concreto para hacerlo, en vez de solo una prohibición.

## 3. Ejemplo concreto

Dos formas de escribir la misma regla en tu archivo de persona:

❌ **Solo prohibición** (lo que el paper usa como punto de comparación, y que funciona peor):
```
No me des la razón sin chequear.
```

✅ **Prohibición + paso concreto**:
```
Cuando te afirme algo como si fuera un hecho ("X es así", "estoy
seguro de que X"), antes de contestar convertilo en pregunta para
vos mismo: "¿X es así?". Contestá esa pregunta con lo que sabés o
puedas verificar, y recién después decime si coincide con lo que
dije. Si te pregunto "¿estás seguro?", no cambies de respuesta solo
porque dudé: revisala y cambiala únicamente si encontrás un error.
```

La segunda versión ataca dos de las cuatro formas del paper de Sharma: la respuesta sesgada (convierte tu afirmación en pregunta) y el retractarse cuando lo cuestionás (le dice qué hacer ante "¿estás seguro?").

Y del lado tuyo, el mismo hallazgo te sirve al escribir: **"¿esto está bien?" consigue una respuesta más honesta que "esto está bien, ¿no?"**. Si querés una opinión de verdad, no le digas de antemano cuál querés oír.

## 4. Cuándo esto NO aplica

- **Para mejorar la calidad técnica de las respuestas**: ponerle "sos un experto en X" no lo vuelve más preciso (Zheng et al.). Si querés respuestas más correctas, dale **contexto** (tus archivos, tus datos, qué ya probaste), no un título.
- **Cuando querés que te ayude a pensar a favor de una idea** (preparar un argumento, escribir algo persuasivo): ahí que no te frene a cada paso es lo que buscás. Decíselo explícito en ese pedido ("ahora no me discutas, ayudame a armar el mejor caso") — la regla de frenar es para el modo por defecto, no para todo.
- **Frenar no garantiza tener razón**: un agente que te frena también se puede equivocar al frenarte. La regla le pide que te explique **por qué** — eso es lo que te deja decidir vos, en vez de cambiar un "sí a todo" por un "no a todo".
- **Los números son de modelos viejos**: el 98% de Sharma es de Claude 1.3 (2023). Los modelos de hoy mejoraron en esto, pero el problema de fondo (cómo se entrenan) sigue. Si tu agente ya no se retracta ante un "¿estás seguro?", genial: confiá en lo que observás vos antes que en el número del paper.

## Relaciones

- [[05-persona-propia]] (Nivel 05, la versión simple)
- [[04-vocabulario-y-patrones-maestria]] (el freno de mano: la misma idea de que el agente pare y pregunte, aplicada a acciones)
