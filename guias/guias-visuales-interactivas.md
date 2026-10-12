# 🧭 Guías visuales e interactivas — que tu agente te lo muestre

> [!WARNING]
> **Esta guía está en prueba.** Sale de una guía real que armamos y que funcionó, pero todavía nadie nuevo la usó de punta a punta. Si algo no te cierra, contalo como pregunta o mejora (mirá [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md)).

Tu agente no solo escribe texto. También puede armarte una **página con dibujos y un paso a paso** para que veas en qué parte del todo estás. Casi nadie lo sabe, y por eso casi nadie lo pide. Esta guía te cuenta qué es, cuándo sirve y cómo pedirlo.

## Para qué sirve

Cuando una tarea tiene muchos pasos, el texto se vuelve una lista larga. Te perdés: no sabés qué ya hiciste, qué falta ni cómo encaja cada paso con el resto.

Un dibujo resuelve eso. Ves el total de un vistazo y ves dónde estás vos. Es como el plano de un mueble para armar: las instrucciones dicen "atornillá la pieza B", pero el dibujo te muestra cuál es la pieza B y dónde va.

Además, el dibujo hace que vos y tu agente hablen de lo mismo. Si le decís "no entiendo esta parte" y señalás el dibujo, los dos saben de qué parte hablan.

## Cómo se ve

Una guía visual tiene hasta tres partes. No siempre van las tres.

**1. El dibujo de todo (2D).** Un esquema plano de la tarea completa: las piezas y cómo se conectan. Es el mapa.

**2. La vista 3D.** Un modelo que podés girar con el mouse para verlo desde cualquier lado. Solo va cuando la tarea es física y la posición importa: dónde va cada cosa, qué está arriba o abajo. Para algo que pasa en la pantalla no hace falta.

**3. El modo armado.** El paso a paso, uno por vez. Cada paso tiene cuatro partes:

| Parte | Qué te dice |
|---|---|
| **Qué hacés** | La acción, concreta y corta |
| **Por qué** | Para qué sirve ese paso |
| **Cómo comprobás** | Una prueba con el resultado que tenés que ver. Si no lo ves, no sigas |
| **Cuidado** | El error más común en ese paso |

Mientras avanzás:

- El dibujo **esconde lo que todavía no hiciste** y **marca el paso actual**. Así ves solo lo que importa ahora.
- Si un paso es **delicado** (puede romper algo o es peligroso), aparece un aviso que te frena: *"este paso es delicado, leé antes"*. Tenés que confirmar para seguir.
- Tu **avance queda guardado**. Si cerrás y volvés mañana, retomás donde estabas.

Ejemplo: armar un circuito en una protoboard (una placa para conectar cables sin soldar). El dibujo 2D muestra todas las conexiones. La vista 3D muestra dónde va cada cable en la placa. El modo armado te lleva cable por cable, y en cada uno te dice qué medir para saber que quedó bien.

## Cómo pedirla

Tu agente te la tendría que ofrecer solo cuando sirve. Si no lo hace, pedila con una frase:

- *"Mostrámelo en un diagrama."*
- *"Armame el paso a paso, uno por vez."*
- *"Haceme una guía visual de esto, con un dibujo de todo."*
- *"Me perdí. ¿Me lo mostrás en un dibujo y me marcás dónde estoy?"*

Si querés, usá la ficha de siempre ([como-pedir.md](como-pedir.md)): **Rol**, **Objetivo** y **Detalle**.

## Cómo la arma tu agente (la receta)

Este es el orden que hizo que funcionara. Si tu agente se saltea un paso, podés pedirle que lo haga.

1. **Define la tarea y para quién es.** Qué querés lograr y cuánto sabés del tema. No es lo mismo explicarle a alguien que arranca de cero.
2. **Junta los datos y los verifica.** Cada dato sale de una fuente oficial (el manual, la página del fabricante). Lo que no pudo confirmar queda marcado **"sin verificar"**. Nunca lo inventa.
3. **Escribe los pasos en texto.** El texto es la base. Si el dibujo y el texto no coinciden, manda el texto.
4. **Recién ahí, los dibujos.** Primero un dibujo quieto, para comprobar que la idea general está bien. Después la versión interactiva.
5. **La revisa antes de dártela.** Mejor si la revisa otra mirada (otro agente, u otra persona). En nuestro caso la revisión encontró dos errores que alguien nuevo habría copiado tal cual: un cable en el lugar equivocado y otro que habría causado un cortocircuito.
6. **La mejora con vos.** Si algo te confunde, **no es tu culpa: es un error de la guía.** Decíselo y tu agente corrige el texto.

## Cómo te la entrega

Depende de lo que pueda hacer tu agente:

- **Si puede publicar una página interactiva**, te pasa el enlace o te la abre.
- **Si no puede**, te deja un archivo `.html` en tu carpeta. Lo abrís con doble clic y se ve en tu navegador.
- **Si trabajás solo en la terminal**, te arma dibujos hechos de texto directo en la conversación. Ver [disenar-para-terminal.md](disenar-para-terminal.md).

Tu agente no te tiene que prometer algo que su herramienta no puede hacer. Si no puede, te lo dice y te ofrece la opción que sí puede.

## Los límites, con honestidad

- **La guía vale lo que valen sus datos.** Un dibujo lindo con un dato mal es peor que un texto feo con el dato bien. Por eso los datos se verifican primero.
- **La vista 3D no siempre suma.** Si la tarea no tiene piezas en el espacio, un buen dibujo plano alcanza.
- **No cuesta lo mismo que una respuesta corta.** Para una pregunta chica, una respuesta chica. La guía visual vale la pena cuando la tarea tiene varios pasos, piezas físicas o cuando te trabaste.
- **Es una guía, no la prueba final.** El paso "Cómo comprobás" te dice qué mirar en la realidad: el resultado en pantalla, la luz que se prende, lo que marca un tester. Si la realidad no coincide con la guía, **confiá en la realidad**, pará y avisale a tu agente.
