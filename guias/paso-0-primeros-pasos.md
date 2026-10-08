# 🧭 Paso 0 — De cero a tu primer mensaje

**Para quién:** para quien nunca instaló un agente ni usó una terminal. Tiempo estimado: 20 a 30 minutos.

> [!NOTE]
> **Esta guía sirve con cualquier agente de código.** Con **Claude Code** te damos el camino más detallado, porque es el que probamos y donde tenemos más control (por ejemplo, el comando `/onboarding` del README). Con otros agentes los pasos son los mismos, pero la instalación y los botones los seguís desde su página oficial, y acá **no podemos garantizar cada pantalla**.

> [!WARNING]
> **Esta guía está en prueba.** Los datos de Claude Code salen de su documentación oficial (consultada el 2026-10-08); para los otros agentes solo enlazamos a su página oficial. Nadie nuevo la siguió todavía de punta a punta. Si algo no coincide con lo que ves en pantalla, **confiá en la pantalla** y dejanos lo que pasó en [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md): es exactamente la información que necesitamos.

## Qué vas a tener al final

Cuatro cosas, en este orden:

1. Un **agente elegido**, con una cuenta o plan que lo incluya.
2. El **agente instalado**.
3. La **carpeta de esta guía** en tu compu.
4. Tu **primer mensaje** enviado.

Es normal que esta parte sea la más incómoda de todo Padawan: acá todavía no te guía el agente, porque todavía no lo tenés. Después de este paso, sí.

## Paso 1 — Elegí tu agente y revisá el plan

Necesitás un **agente de código**: uno que pueda abrir una carpeta, leer y escribir archivos, y pedirte permiso antes de hacer cosas. Un chat común no sirve.

| Agente | Cómo se usa | Plan y costo | Dónde instalarlo (oficial) |
|---|---|---|---|
| **Claude Code** | App de escritorio (pestaña *Code*) o terminal | Requiere un **plan de pago** (Pro, Max, Team o Enterprise) o una cuenta de Console. El plan gratuito de claude.ai no lo incluye, según su documentación | Paso 3, camino Claude |
| **Codex CLI** (OpenAI) | Terminal | Depende de tu plan de ChatGPT o de una API key. Confirmalo en su página oficial: las fuentes no coinciden | [developers.openai.com/codex/cli](https://developers.openai.com/codex/cli) |
| **Cursor** | Editor con modo *Agent* | Tiene un plan gratuito con límites; confirmá las condiciones actuales en su [página de precios](https://cursor.com/help/account-and-billing/pricing) | [Primeros pasos oficiales](https://cursor.com/help/getting-started/first-project) |
| **Otros** (Windsurf, etc.) | Según la herramienta | Mirá su página oficial | Su página oficial |

Los planes y las condiciones cambian seguido: **no pagues nada que no entiendas** y mirá siempre la oferta actual en la página oficial. Si no estás seguro de que tu herramienta sirve, el checkpoint del Nivel 01 es justo ese chequeo.

## Paso 2 — Conseguí la carpeta de esta guía

1. Abrí esta página en el navegador: [github.com/GuidoB22/Padawan-Protocol](https://github.com/GuidoB22/Padawan-Protocol).
2. Tocá el botón verde **Code** y después **Download ZIP**.
3. Buscá el archivo `.zip` en tu carpeta de Descargas y **extraelo** (clic derecho → *Extraer todo*). No lo abras desde adentro del zip.
4. Movela a un lugar fácil de recordar, por ejemplo `Documentos\padawan-protocol`.

> [!WARNING]
> **Siempre vas a trabajar en esta misma carpeta.** Si la próxima vez abrís tu agente en otra, es como si nada de lo que hicimos existiera. Anotá dónde la dejaste. Más detalles en [FASES.md](../FASES.md).

## Paso 3 — Instalá el agente

### Si elegiste otro agente

Seguí la instalación de **su página oficial** (enlaces del Paso 1) y volvé acá cuando lo tengas abierto y con la sesión iniciada. No te damos comandos de otros agentes porque no los verificamos y cambian seguido.

### Si elegiste Claude Code

**Camino A (el más simple, sin terminal): la app de escritorio de Claude**

1. Descargá el instalador desde la [página oficial de descargas](https://claude.com/download), para Windows o Mac, y ejecutalo.
2. Abrí **Claude** (en Windows, desde el menú Inicio; en Mac, desde Aplicaciones) e **iniciá sesión** con tu cuenta.
3. Arriba, en el centro, tocá la pestaña **Code**. Si te pide actualizar de plan, volvé al Paso 1.

La app de escritorio ya incluye el agente: no necesitás instalar nada más.

**Camino B: en la terminal**

Una terminal es una ventana donde se escriben comandos. Si nunca usaste una, mirá primero la [guía oficial para principiantes](https://code.claude.com/docs/en/terminal-guide). Después, según tu sistema:

**Windows (PowerShell):**

```
irm https://claude.ai/install.ps1 | iex
```

**Mac, Linux o WSL:**

```
curl -fsSL https://claude.ai/install.sh | bash
```

Cuando termine, **cerrá la terminal, abrí una nueva** y escribí `claude --version`. Si muestra un número de versión, quedó instalado. Si dice que `claude` no se reconoce, mirá [PROBLEMAS-FRECUENTES.md](../PROBLEMAS-FRECUENTES.md).

> [!NOTE]
> Si ves el error `'irm' is not recognized`, estás en CMD y no en PowerShell. Buscá "PowerShell" en el menú Inicio y probá de nuevo.

La primera vez que escribas `claude`, te va a pedir iniciar sesión en el navegador.

## Paso 4 — Abrí la carpeta de la guía con el agente

Todos los agentes tienen alguna forma de abrir una carpeta: un menú (por ejemplo, en Cursor, **File → Open Folder**), un botón para elegir carpeta, o ir a la carpeta desde la terminal y arrancar el agente ahí. Buscá la de tu herramienta y elegí la carpeta del Paso 2.

**Con Claude Code, app de escritorio:** en la pestaña **Code**, elegí **Local**, tocá **Select folder** y elegí la carpeta del Paso 2.

**Con Claude Code, terminal:** andá a la carpeta del Paso 2 y escribí `claude` ahí. Si no sabés cómo "ir" a una carpeta, mirá la [guía de terminal](https://code.claude.com/docs/en/terminal-guide).

**Un consejo para el principio:** buscá en tu agente la opción de que **te pida confirmación antes de editar archivos o ejecutar comandos**, así ves qué va a cambiar. En la app de escritorio de Claude está en el selector del *modo de permisos*, al lado del botón de enviar: elegí **Manual**. Es lo que conviene mientras estás aprendiendo.

## Paso 5 — Tu primer mensaje

Escribí esto en el agente, tal cual:

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Leé el archivo INSTRUCCIONES-AGENTE.md de esta carpeta y seguí
> exactamente lo que dice, empezando por el Nivel 00.
> ```

Desde acá el agente te guía. Van a aparecer **pedidos de permiso**: es normal, leelos de a uno. En el [README](../README.md) está la sección "Qué esperar al principio".

## Si algo falla

| Qué ves | Qué hacer |
|---|---|
| Al tocar **Code** (Claude) te pide actualizar de plan | Necesitás un plan de pago (Paso 1) |
| Un **error 403** en la pestaña Code (Claude) | Mirá la [ayuda oficial para errores de autenticación](https://code.claude.com/docs/en/desktop#403-or-authentication-errors-in-the-code-tab) |
| `claude` no se reconoce en la terminal | Cerrá la terminal y abrí una nueva; si sigue, [PROBLEMAS-FRECUENTES.md](../PROBLEMAS-FRECUENTES.md) |
| Un problema con otro agente | Su ayuda oficial primero; después anotalo con [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md) |
| Cualquier otra cosa | Anotalo con [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md) |

## Checkpoint

- [ ] Elegí un agente y tengo un plan o cuenta que lo incluye.
- [ ] La carpeta de la guía está extraída en un lugar que recuerdo.
- [ ] Mi agente está instalado y con la sesión iniciada.
- [ ] Abrí la carpeta de la guía con el agente.
- [ ] Mandé el primer mensaje y el agente empezó el Nivel 00.
