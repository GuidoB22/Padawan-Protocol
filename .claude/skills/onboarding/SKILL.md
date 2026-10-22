---
name: onboarding
description: "Punto de entrada de Padawan Protocol: chequea si hay una version nueva del repo, revisa que ya esta armado en esta carpeta, pide lo que falte, y continua desde el nivel correcto. Usalo para arrancar o retomar la guia."
license: MIT
metadata:
  author: padawan-protocol
  version: "1.0"
---

## Rol: agente de onboarding

Sos el mismo agente de siempre, en "modo onboarding" mientras corre este skill. Este skill es el punto de entrada — reemplaza tener que pegarle a mano el texto del README. Leé `INSTRUCCIONES-AGENTE.md` (raiz del repo) si todavia no lo hiciste esta sesion, y segui TODAS sus reglas duras a partir de aca. No hay sub-agentes ni delegacion — un solo rol, vos, cambiando de nivel.

## 0. Una sola lista de permisos (Regla dura #4 de INSTRUCCIONES-AGENTE.md)

Antes del paso 1 (que ya usa internet), fijate si existen `memoria.md` o `quien-soy.md` (mirar no pide permiso). Si no existen, es la primera sesión: mostrale a la persona la tabla única de permisos de la Regla #4 y esperá su "ok" antes de seguir. Si existen, alcanza con una frase ("van a aparecer los mismos permisos de la otra vez").

## 1. Chequeo de version (Regla dura #7 de INSTRUCCIONES-AGENTE.md)

```
git fetch && git log HEAD..origin/master --oneline
```

Si no devuelve nada, seguí normal. Si devuelve algo Y esta carpeta ya tiene `memoria.md` o `quien-soy.md`, hacé el repaso completo de la Regla #7 antes de seguir (en qué nivel había quedado, qué cambió en formato corto, preguntar cómo seguir) — no lo saltees por estar dentro de este skill.

## 2. Chequeo de estado — qué ya está armado en esta carpeta

Esta carpeta tiene un script de solo lectura que hace este chequeo y lo muestra en colores (verde = listo): `scripts/chequeo-estado.ps1` (Windows) o `scripts/chequeo-estado.sh` (Mac/Linux). Antes de correrlo:

1. Explicale a la persona en una frase qué vas a ejecutar y qué hace ("es un script que solo LEE esta carpeta, no cambia ni borra nada, y te muestra en colores qué está listo") — es la Regla dura #4 de `INSTRUCCIONES-AGENTE.md`, no la saltees por estar dentro de un skill.
2. Corré el script que corresponda a tu sistema operativo, tal cual (Regla dura #12): en Windows `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/chequeo-estado.ps1`, en Mac/Linux `bash scripts/chequeo-estado.sh`.
3. Usá el resultado para armar el estado real — no le preguntes a la persona "¿en qué nivel estabas?", decíselo vos a partir de lo que el script mostró.

Si por algún motivo no podés correr el script (permiso denegado, sistema raro), hacé el mismo chequeo a mano mirando si existen estos archivos/carpetas:

| Archivo/carpeta | Qué significa si existe |
|---|---|
| (nada de lo de abajo) | Sesión nueva — no hay Nivel 00 hecho todavía |
| `quien-soy.md` | Nivel 00 confirmado |
| `memoria.md` | Nivel 02 confirmado — leé ahí el último nivel que quedó marcado, es la fuente de verdad, no asumas |
| `.obsidian/` | Segundo cerebro con Obsidian activo (Nivel 03) |
| `.obsidian/plugins/obsidian-local-rest-api/data.json` | Plugin de conexión MCP instalado — confirmá si además hay una conexión MCP real activa en tu propia configuración, no asumas que por estar el plugin ya está conectado |
| `segundo-cerebro/` sin `.obsidian/` | Segundo cerebro en texto plano, sin Obsidian |
| un archivo de persona propia en la raíz (Nivel 05, nombre lo elige la persona) | Persona propia ya escrita |

Con esto armado, decile a la persona en 1-2 frases dónde está parada, y si falta algo puntual que la actualización trajo (ejemplo real: alguien con `.obsidian/` pero sin el plugin de Local REST API — avisale que ahora existe esa parte y preguntale si la quiere sumar) ofrecéselo explícito, no lo des por sentado.

## 3. Continuar

Seguí desde el nivel que corresponde según el estado de arriba, respetando el orden fijo de `INSTRUCCIONES-AGENTE.md`. Si no hay nada de la tabla de arriba, es sesión 100% nueva: mostrá `FASES.md` y arrancá por `niveles/00-contexto.md`, como dice "Cómo arrancar" en `INSTRUCCIONES-AGENTE.md`.

## Nota — esto es específico de Claude Code

Este archivo (`.claude/skills/`) solo lo reconocen agentes compatibles con Skills de Claude Code. Si estás en Codex CLI, Cursor u otra herramienta: el MISMO chequeo (versión + estado de la carpeta) ya está descripto en lenguaje plano en `INSTRUCCIONES-AGENTE.md` — seguí ese archivo directo, no hace falta este skill para que funcione.
