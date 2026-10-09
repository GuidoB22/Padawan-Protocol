# 🧭 Cómo pedirle cosas a tu agente — la ficha de 3 líneas

> [!WARNING]
> **Esta guía está en prueba.** Todavía nadie nuevo la usó de punta a punta. Si algo no te cierra, contalo como pregunta o mejora (mirá [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md)).

Tu agente trabaja mejor con **un pedido corto, de una sola cosa y bien definido** que con un mensaje largo que mezcla varias. Esta guía te da una forma simple de pedir: **la ficha**.

> [!TIP]
> **Versión visual e interactiva:** abrí [`como-pedir.html`](como-pedir.html) en tu navegador (doble clic, no necesita internet). Ahí podés probar la ficha con ejemplos y ver el camino de un pedido paso a paso.

## La ficha

Copiala, completá las tres líneas y mandala:

```
Rol:      [qué papel querés que cumpla tu agente]
Objetivo: [qué querés lograr, en una línea]
Detalle:  [lo mínimo que tiene que hacer, en 1 a 3 líneas]
```

Un ejemplo completo:

```
Rol:      Revisor de textos
Objetivo: Corregir el mail para el cliente
Detalle:  Que suene cordial y corto. No cambies los números.
```

| Campo | Qué poner | Ejemplos |
|---|---|---|
| **Rol** | El papel que cumple tu agente en *esta* tarea | revisor, redactor, tester, profe, organizador |
| **Objetivo** | El título de lo que querés lograr, en grande | "Ordenar mis gastos del mes", "Armar el reporte trimestral" |
| **Detalle** | Lo mínimo para que no tenga que adivinar | formato, tono, qué no tocar, para quién es |

> [!NOTE]
> **Rol** no es lo mismo que **Tu persona** (Nivel 05). Tu persona son las reglas de cómo te habla siempre. El rol es el papel que le pedís para una tarea puntual.

## Lo que no va en la ficha

Quién sos, tus reglas y lo que ya hablaron **no se repite en cada pedido**: vive en tus archivos (`quien-soy.md`, `memoria.md`, tu persona). Si lo escribís de nuevo, el pedido se alarga y el agente rinde peor.

## Si tenés mucho texto, no lo pegues: guardalo en un archivo

Nunca le pegues al agente cientos de líneas en el mensaje. Hacé esto:

1. Pegá el texto en el Bloc de notas y guardalo como `.txt` en la carpeta `entrada/` (el [Caso 02](../casos-de-uso/02-ingesta-de-proyecto.md) te explica cómo armarla).
2. En la ficha, en **Detalle**, escribí solo el nombre del archivo: *"Leé `entrada/reunion-octubre.txt`"*.

Por qué conviene: tu agente **lee solo la parte que necesita** y, cuando termina, guarda un resumen corto en tus notas. La próxima vez usa el resumen y no vuelve a leer el original. Además no se rompe el formato ni chocás con el límite de tamaño del chat. Leer un archivo no es gratis, porque el contenido igual entra en la conversación. El ahorro viene de leer solo lo necesario y de no repetirlo.

## Si te falta un campo

Tu agente no te hace llenar un formulario: te pregunta **solo el campo que falta**, de a una pregunta.

## Si pedís varias cosas juntas

Tu agente **no las mezcla**. Te las lista, te ayuda a ordenarlas y te pregunta por cuál empezar. Después hacen una, la cierran y pasan a la siguiente.

```
Vos:    Quiero ordenar mis gastos, armar el reporte y mandárselo a mi jefe.
Agente: Son 3 cosas. Las pondría en este orden:
        1) Ordenar los gastos  2) Armar el reporte  3) Mandarlo.
        ¿Empezamos por la 1?
```

## Si no sabés qué querés

Pasa, y está bien. Decile a tu agente:

```
No sé bien qué quiero. Guiame.
```

Entonces te hace **hasta 3 preguntas, de a una**:

1. ¿Qué te gustaría que quede resuelto?
2. ¿Para qué lo necesitás?
3. ¿Quién lo va a ver o usar?

Con tus respuestas arma **tu hoja de ruta**: una lista corta de pasos chicos, cada uno con su ficha. Vos la mirás, la corregís si hace falta, y la siguen **un paso por vez**.

## Cómo termina cada pedido

Un pedido no termina cuando el agente escribe algo, sino cuando **te entrega lo que pediste y lo validan juntos**:

1. El agente te muestra el resultado y lo compara con tu **Objetivo**: qué quedó hecho y qué no.
2. Te pregunta, una sola pregunta: *"¿Esto es lo que pediste?"*
3. Si dice que no, vos decís qué falta y se ajusta ese punto, sin empezar de cero.
4. Si dice que sí, tu agente te **pide tu opinión de forma explícita**: *"¿Qué funcionó y qué cambiarías?"*. Es una sola pregunta, y tu respuesta vale más que cualquier suposición.
5. Con tu opinión, tu agente **guarda lo aprendido**: en tu memoria (`memoria.md`, o el sistema de memoria que use tu agente) y en tu vault (Nivel 03), para no volver a explicarlo.
6. Si lo que hicieron **puede volver a servirte** (un reporte mensual, una forma de revisar mails), tu agente **te propone convertirlo en un skill** ([Caso 05](../casos-de-uso/05-tu-propio-skill.md)). Vos decidís si sí o no.

Después de eso, pasan al siguiente paso de la hoja de ruta.

## Checkpoint

Antes de seguir, comprobá que lo entendiste. Contale a tu agente **con tus palabras** qué va en cada campo de la ficha, o pedile que te haga una pregunta de práctica.
