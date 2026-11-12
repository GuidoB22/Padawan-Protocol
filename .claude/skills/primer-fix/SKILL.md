---
name: primer-fix
description: "Punto de entrada del Sendero del Caballero (tu primer fix en un proyecto open source): chequea el gate, encuentra o crea la bitacora de la persona, decide desde que mision retomar y la guia de a un comando por vez. Usalo para arrancar o retomar ese sendero."
license: MIT
metadata:
  author: padawan-protocol
  version: "1.0"
---

## Rol: par en el sendero

Sos el mismo agente de siempre, en "modo sendero" mientras corre este skill. Es el punto de entrada del sendero de software: reemplaza pegarle a mano el bloque "Decile esto a tu agente" del README del sendero. Leé `INSTRUCCIONES-AGENTE.md` (raiz del repo) si todavia no lo hiciste esta sesion, y segui sus reglas duras tal como las acota la #19: mientras dura el sendero, las reglas pensadas para los niveles (orden fijo, Nivel 00, lenguaje simple) no aplican. No hay sub-agentes ni delegacion.

> [!WARNING]
> Este skill esta en prueba (🧪 en prueba), igual que el sendero.

## 1. Leer lo que manda

Leé `senderos/software/README.md`. Ahi estan el gate, las 8 reglas, la preparacion y el indice de misiones.

## 2. Gate

Preguntale a la persona, una cosa por vez, si cumple el gate del README del sendero: programa y lee codigo, tiene Git, Docker, cuenta de GitHub y `gh`, y un agente trabajando en su maquina. No instales nada vos: si falta una herramienta, decile el comando exacto, que cambia en su computadora y como se deshace (Regla dura #16), y que lo corra ella.

## 3. Bitacora

Preguntale donde esta su bitacora. Si no tiene, ofrecele crearla desde `senderos/software/bitacora.plantilla.md` en la carpeta de trabajo que ella elija, y esperá su respuesta antes de crear nada.

## 4. Decidir desde que mision seguir

Leé la bitacora y proponele la mision desde la que retomar, segun que secciones ya tiene completas:

- "Issue" completo: la mision 01 esta hecha.
- "Entorno" e "Hipotesis" con la reproduccion (o la conclusion de por que no reproduce): la 02 esta hecha.
- "Causa", "Plan del fix" y "Evidencia": la 03 esta hecha.
- "PR" con link: la 04 esta en curso.

Retoma en la primera mision con el checkpoint incompleto. La plantilla no registra todo (la app elegida, el comentario en el issue, la evidencia de la preparacion): eso preguntaselo. Si la bitacora es la plantilla sin completar, empeza por el checkpoint del README del sendero. Confirma la mision con la persona antes de seguir.

## 5. Guiar la mision

Leé el archivo de esa mision en `senderos/software/` y guiala bajo la Regla dura #19: un comando por vez, que corre la persona. No publiques nada por ella (push, pull request, comentarios).

Al final de cada mision, confirma el checkpoint pidiendo la evidencia y verificandola antes de pasar a la siguiente. Anotalo en la bitacora.

## Nota — esto es especifico de Claude Code

Este archivo (`.claude/skills/`) solo lo reconocen agentes compatibles con Skills de Claude Code. Si estas en otro agente: el bloque "Decile esto a tu agente" del README del sendero (`senderos/software/README.md`) arranca el mismo trabajo en conversacion; el chequeo del gate y desde que mision retomar se lo pedis vos al agente.
