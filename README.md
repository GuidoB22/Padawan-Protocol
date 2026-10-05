<p align="center">
  <img src="assets/master-protocol-banner.webp" alt="Master Protocol 2.0 — ahora en Linux / Unix" width="100%">
</p>

# 🧭 Padawan Protocol

Esta guía no se lee sola. Se hace **hablando con tu agente**, en el orden que sigue. Cada nivel termina con un bloque de texto que le decís literalmente a tu agente para que haga el paso con vos.

**Pensada para cualquiera, sin importar cuánto sepas de computadoras.** Si nunca usaste algo así, tranquilo/a — está armada para que tu agente te vaya llevando de la mano, un paso genuinamente chico a la vez.

## 👉 Primer paso, siempre: decile esto a tu agente

Abrí esta carpeta con tu agente y decile, literal:

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Leé el archivo INSTRUCCIONES-AGENTE.md de esta carpeta y seguí
> exactamente lo que dice, empezando por el Nivel 00.
> ```

**¿Usás Claude Code?** Podés escribir `/onboarding` en vez del texto de arriba — es el mismo flujo empaquetado como skill (ver `.claude/skills/onboarding/`), con el chequeo de versión y de qué ya tenés armado hecho automáticamente antes de arrancar o retomar. Con otro agente (Codex CLI, Cursor, etc.), usá el texto de arriba — hace exactamente lo mismo, solo que en conversación en vez de comando.

Eso alcanza — el resto lo va guiando el agente solo, un paso por vez. Todo lo que sigue en este README es referencia, no hace falta leerlo entero antes de arrancar.

## 🎯 Qué vas a lograr, y cómo

**El qué:** mejorar tu trabajo de todos los días con tu agente de IA. Que se acuerde de quién sos y de lo que venís haciendo, que haga solo lo repetitivo y que se conecte a las herramientas que ya usás.

**El cómo:** con un puñado de piezas que se van sumando una arriba de la otra. Al principio un agente es como un chat: cada día arranca de cero y vos le explicás todo de nuevo. Con estas piezas pasa a ser un compañero que ya conoce tu contexto.

| Pieza | Para qué te sirve | Dónde se aprende |
|---|---|---|
| Contexto y memoria | Tu agente sabe quién sos y no arranca de cero cada día | [Niveles 00 a 02](niveles/00-contexto.md) |
| Vault y etiquetas | Todo lo que sabés, ordenado y fácil de encontrar | [Nivel 03](niveles/03-segundo-cerebro.md) |
| MCP | Conectar tu agente a otras herramientas (documentación, tickets, correo) | Nivel 03 (tu vault) y [caso 03](casos-de-uso/03-mcp-con-api-key.md) (un servicio externo, con API key) |
| Skills | Una tarea repetida siempre igual, y que el agente revisa antes de entregártela | [Caso 01](casos-de-uso/01-reporte-recurrente.md) |
| Rutinas | Que lo repetitivo se haga en un momento fijo (un reporte por mes, por ejemplo) | Caso 01, a mano primero. Programarlas solo todavía no tiene guía acá |
| Varios agentes con roles | Uno analiza, otro desarrolla, otro prueba | Todavía no tiene guía acá |
| [gentle-ai](https://github.com/Gentleman-Programming/gentle-ai) | Un instalador que le arma a tu agente memoria, flujos y skills ya listos | Opcional y externo: no hace falta para esta guía |

**Tres situaciones donde se nota:**

- Te piden un **reporte trimestral** y no te acordás qué hiciste: anotás poco cada semana y tu agente lo arma. → [Caso 01](casos-de-uso/01-reporte-recurrente.md)
- Volvés a un **proyecto** con mails, chats y notas desparramados: los dejás en una carpeta y le preguntás "¿en qué quedó?". → [Caso 02](casos-de-uso/02-ingesta-de-proyecto.md)
- En tu trabajo te piden usar una **herramienta nueva** que se conecta con una clave: ya sabés el patrón. → [Caso 03](casos-de-uso/03-mcp-con-api-key.md)

## ⚠️ Prerequisito — leé esto ANTES de empezar

Esto **no funciona con un chat común** (ChatGPT en chatgpt.com, Claude en claude.ai, Gemini, etc.). Esos chats pueden hablar con vos, pero no pueden tocar archivos en tu computadora — y esta guía es, literalmente, crear y editar archivos junto a tu agente. Si intentás hacer esto en un chat común, el agente no va a poder ejecutar nada real: como mucho te va a *describir* qué archivo crearía, y ahí es donde la cosa empieza a andar en círculos (inventa una alternativa a mano, te promete algo que no puede cumplir, etc.).

Necesitás un **agente de código** — un programa que corre en tu computadora, que podés abrir apuntando a una carpeta, y que tiene permiso real para leer, crear y escribir archivos (y en niveles más avanzados, ejecutar comandos). Ejemplos:

- **Si usás Claude**: [Claude Code](https://claude.com/claude-code) (CLI o la app de escritorio). Es la opción con la que se armó y probó esta guía.
- **Si usás ChatGPT**: el **Codex CLI** de OpenAI (agente de código, distinto del chat web).
- Otras opciones válidas: Cursor (en modo agente), Windsurf, o cualquier herramienta que se describa a sí misma como "coding agent" / "agente de código" con acceso a archivos.

La mayoría de estas herramientas tiene alguna forma de prueba gratuita o plan gratuito — están cambiando seguido, así que anda directo a la página oficial de la que elijas y fijate la oferta actual en vez de confiar en un número que alguien te pasó de memoria.

**¿No estás seguro si lo que tenés abierto es esto?** El checkpoint del Nivel 01 es justo ese chequeo — 30 segundos, y si falla ahí, es que no tenés la herramienta correcta, no que algo esté mal con la guía.

Todo lo demás (memoria, base de conocimiento, vocabulario, tu propia forma de trabajar) lo vamos construyendo con archivos de texto simples, un nivel a la vez — con el agente correcto, ya elegido.

## Cómo usar esto

1. Abrí esta carpeta con tu agente.
2. Decile la frase de arriba ("Leé INSTRUCCIONES-AGENTE.md...").
3. Respondé las preguntas que te haga, hacé la acción de cada nivel, confirmá el checkpoint.
4. El agente te va llevando de nivel en nivel — vos no tenés que acordarte del orden ni abrir los archivos a mano si no querés.

## Índice

| Nivel | Qué resuelve |
|---|---|
| [00 — Contexto](niveles/00-contexto.md) | Quién sos, para qué querés esto — va antes que cualquier otra cosa |
| [01 — Fundamentos](niveles/01-fundamentos.md) | Qué es esto de "trabajar con un agente" |
| [02 — Memoria persistente](niveles/02-memoria-persistente.md) | Que tu agente no se olvide todo entre sesiones |
| [03 — Segundo cerebro](niveles/03-segundo-cerebro.md) | Una base de conocimiento que crece con el tiempo (acá también se instala Obsidian, si querés) |
| [04 — Vocabulario y patrones](niveles/04-vocabulario-y-patrones.md) | Cómo organizar el trabajo sin perderte |
| [05 — Persona propia](niveles/05-persona-propia.md) | Que tu agente te hable como vos querés, y te frene cuando hace falta |
| [06 — Avanzado (opcional)](niveles/06-avanzado-opcional.md) | Para cuando ya tengas todo lo anterior andando |

**¿Cuánto tarda todo esto, y cuándo puedo pausar?** Ver [FASES.md](FASES.md) — tabla con tiempo estimado por fase y desde dónde podés parar y seguir después (incluso con otro agente).

## 🧰 ¿Querés aplicarlo ya a tu trabajo?

Después del Nivel 03 podés hacer los **casos de uso**: recetas de trabajo real (un reporte recurrente, ordenar la información de un proyecto, conectar un servicio con una API key). Son independientes entre sí y no cambian el camino de los 7 niveles. Ver [casos-de-uso/README.md](casos-de-uso/README.md).

## 🐧 ¿Querés hacerla en Linux?

Funciona igual. Ver [guias/linux-mint.md](guias/linux-mint.md): cómo conseguir Linux Mint de la página oficial, probarlo en una máquina virtual sin riesgo o instalarlo con un pendrive y Rufus, y arrancar la guía ahí con tu agente.

## 🎓 ¿Ya terminaste los 7 niveles?

Hay un paso más, opcional, para cuando quieras entender el **por qué** de lo que ya armaste — con evidencia real citada, ejemplos y una rutina que lo mantiene al día solo. Ver [maestria/00-bienvenida-maestria.md](maestria/00-bienvenida-maestria.md). No es necesario para usar tu agente bien — es para quien quiere ir más profundo.

## ¿Te trabaste o te dio bronca en algún momento?

Es normal, y es útil — esto es un proyecto vivo, no algo terminado. Mirá [COMO-PEDIR-AYUDA.md](COMO-PEDIR-AYUDA.md) — podés dejarlo anotado en Discord o como issue de GitHub, y capaz ya está resuelto en [PROBLEMAS-FRECUENTES.md](PROBLEMAS-FRECUENTES.md).

## Por qué existe

Nace de una sesión real armando exactamente este sistema (memoria + base de conocimiento + patrones de trabajo + persona propia) desde cero, con resultado que funciona en uso real. Esta guía saca la parte específica de esa sesión y deja la forma genérica — para que cualquiera pueda armar la suya, no una copia de la de otro.

## Convención visual (para quien edite esta guía)

Cada bloque de acción ("Decile esto a tu agente") usa siempre el mismo formato — GitHub lo renderiza en color, sin depender de ningún asset externo:

```markdown
> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> [contenido literal]
> ```
```

🧭 (brújula) es la marca recurrente de la guía — va en el título de cada nivel (`# 🧭 Nivel 0X — ...`) y en cada bloque de acción. Si agregás un nivel o un bloque nuevo, seguí el mismo patrón en vez de uno propio.
