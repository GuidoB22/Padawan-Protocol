# 🧭 Nivel 00 — Antes que nada: contexto

Esto es lo primero que pasa, antes de tocar un solo archivo. No hace falta saber nada de computadoras para este paso — es solo una charla.

## Por qué esto va primero

Si tu agente arranca directo a crear archivos o hablarte de "memoria" o "ramas de trabajo" sin saber quién sos ni para qué querés usarlo, va a construir algo genérico que después no te sirve, o te va a marear con palabras que todavía no hacen falta. Primero se presenta y te pregunta. Recién después hace algo.

## Qué tiene que pasar acá

Tu agente te tiene que preguntar, UNA pregunta a la vez, esperando tu respuesta antes de seguir a la próxima:

1. **¿Quién sos y a qué te dedicás?** (trabajo, estudio, o simplemente uso personal — lo que sea, no hay respuesta incorrecta)
2. **¿Para qué querés usar un agente de IA?** (ejemplos: "quiero que me ayude a organizar mis cosas", "quiero aprender a programar", "quiero que me ayude a escribir", "todavía no sé, quiero probar")
3. **¿Qué esperás lograr, aunque sea una idea vaga?** (no hace falta un plan armado — "algo que me ayude a no olvidarme cosas" ya alcanza como respuesta)

Con esas tres respuestas, tu agente guarda un resumen corto en un archivo (`quien-soy.md`) que va a leer en cada nivel siguiente, para adaptar cómo te explica las cosas — no es tu curriculum, son 3-4 líneas.

## Checkpoint

Existe el archivo `quien-soy.md` con tus tres respuestas resumidas, y tu agente te las repite en una frase para confirmar que entendió bien.

**Prueba:** tu agente corre el chequeo de estado (Regla #12) y te muestra la línea `[OK] Nivel 00 -- contexto (quien-soy.md)`. Vos confirmás que su frase resume bien tus tres respuestas.

---

> [!TIP]
> 🧭 **Decile esto a tu agente (o simplemente pegale este archivo entero y decile "segui esto"):**
>
> ```
> Antes de armar nada, quiero que me hagas 3 preguntas, una por vez,
> esperando mi respuesta antes de la siguiente:
> 1) ¿Quién sos y a qué te dedicás?
> 2) ¿Para qué querés usar un agente de IA?
> 3) ¿Qué esperás lograr, aunque sea una idea vaga?
>
> Con mis respuestas, creá un archivo quien-soy.md con un resumen
> corto (3-4 líneas), y repetime el resumen para confirmar que
> entendiste bien antes de seguir a lo próximo.
> ```
