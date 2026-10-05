# 🧭 Caso 04 — Conectar tu agente con las herramientas del trabajo

**Requiere: Nivel 03** (y haber visto el [caso 03](03-mcp-con-api-key.md)). Tiempo estimado: 30 minutos para decidir y pedir; la conexión depende de tu área de IT.

> [!WARNING]
> **Esta receta no está probada de punta a punta.** Está armada con la documentación oficial de cada proveedor (links abajo). Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md).

## El problema

En el caso 03 usaste una clave. En el trabajo casi nunca va a ser así: lo normal es **"Iniciar sesión con tu cuenta de la empresa"**, y lo que frena no es la técnica sino el **permiso**. Es como querer entrar a una oficina: tenés que saber a qué puerta ir y a quién pedirle la tarjeta.

La buena noticia: cuando conectás una herramienta así, tu agente actúa **con tus permisos y no más**. Si vos no podés ver una carpeta, él tampoco.

## Paso 1 — ¿Qué usa tu empresa?

| Si usás... | Qué te conecta | Quién tiene que aprobar |
|---|---|---|
| Outlook, Teams, SharePoint, OneDrive (Microsoft 365) | [Conector de Microsoft 365](https://support.claude.com/en/articles/12542951-set-up-the-microsoft-365-connector) | Un administrador de Microsoft de tu empresa, **una sola vez para todos** |
| Confluence, Jira | [MCP de Atlassian](https://github.com/atlassian/atlassian-mcp-server) con inicio de sesión | Normalmente nadie. Con **clave API**, [solo si el administrador la habilita](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/configuring-authentication-via-api-token/) |
| Gmail, Calendar, Drive (Google) | [Conectores de Google](https://support.claude.com/en/articles/10166901-use-google-workspace-connectors) | Con cuenta personal, nadie. Con cuenta de empresa, lo que permita su administrador |

Dos aclaraciones: algunos conectores conectan **una sola cuenta a la vez**, y no verificamos si el de Microsoft 365 funciona desde todos los agentes (la documentación lo presenta como conector de Claude).

## Paso 2 — Antes de pedir nada: la política de datos

Fijate si tu empresa permite usar un agente de IA con datos internos. Si no estás seguro, preguntalo: es mejor una pregunta de más que un problema después. Si la respuesta es "no", andá directo al Paso 4.

## Paso 3 — Pedirle a IT (con un mensaje claro)

Un pedido vago ("quiero usar IA") se demora. Uno concreto se resuelve. Pedile a tu agente que lo redacte:

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Ayudame a escribirle un mensaje corto y cordial al área de IT de
> mi empresa. Quiero conectar mi agente de IA con [Outlook y Teams /
> Confluence / Google Drive] para [lo que querés lograr, por ejemplo
> armar mi reporte mensual]. Tiene que explicar: qué herramienta
> necesito, que el agente solo ve lo que yo ya puedo ver, y que
> pido acceso de SOLO LECTURA al principio. Preguntá si hay una
> política sobre usar IA con datos de la empresa. No inventes
> detalles técnicos que yo no te dije.
> ```

Pedí **solo lectura** primero: que el agente lea y resuma, sin enviar ni borrar nada. Escribir se agrega después, con más confianza.

## Paso 4 — Plan B: sin permisos, igual podés

Si IT dice que no, o tarda, el [caso 02](02-ingesta-de-proyecto.md) funciona igual: exportás los mails o documentos que necesitás a una carpeta y tu agente los ordena en tu vault. Es más manual, pero no depende de nadie.

## Paso 5 — Probar con algo chico

Cuando te lo habiliten, empezá por una pregunta de solo lectura.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Usando la conexión con [mi herramienta], buscá lo último sobre
> [un proyecto o tema] y resumímelo en 5 líneas. Decime qué
> herramienta usaste y qué fuentes encontraste. No modifiques,
> envíes ni borres nada.
> ```

## Checkpoint

- [ ] Sé qué herramientas usa mi empresa y qué las conecta (la tabla del Paso 1).
- [ ] Consulté (o sé cómo consultar) la política de datos de mi empresa.
- [ ] Tengo un mensaje para IT, de solo lectura, listo para enviar.
- [ ] Sé que si no me lo habilitan tengo el plan B del caso 02.
