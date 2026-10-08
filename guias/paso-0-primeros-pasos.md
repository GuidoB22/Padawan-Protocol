# 🧭 Paso 0 — De cero a tu primer mensaje

**Para quién:** para quien nunca instaló un agente ni usó una terminal. Tiempo estimado: 20 a 30 minutos.

> [!WARNING]
> **Esta guía está en prueba.** Se armó con la documentación oficial de Claude Code (consultada el 2026-10-08), pero todavía nadie nuevo la siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, **confiá en la pantalla** y dejanos lo que pasó en [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md): es exactamente la información que necesitamos.

## Qué vas a tener al final

Cuatro cosas, en este orden:

1. Una **cuenta con un plan que incluya el agente**.
2. El **agente instalado**.
3. La **carpeta de esta guía** en tu compu.
4. Tu **primer mensaje** enviado.

Es normal que esta parte sea la más incómoda de todo Padawan: acá todavía no te guía el agente, porque todavía no lo tenés. Después de este paso, sí.

## Paso 1 — Cuenta y plan

> [!IMPORTANT]
> **Claude Code necesita un plan de pago** (Pro, Max, Team o Enterprise) **o una cuenta de Console**. Según su documentación oficial, el **plan gratuito de claude.ai no lo incluye**. Mirá los precios actuales en la [página oficial](https://claude.com/pricing) y no pagues nada que no entiendas.

Si preferís otro agente (Codex CLI, Cursor, etc.), consultá la página oficial de esa herramienta: los planes y las condiciones cambian seguido.

## Paso 2 — Conseguí la carpeta de esta guía

1. Abrí esta página en el navegador: [github.com/GuidoB22/Padawan-Protocol](https://github.com/GuidoB22/Padawan-Protocol).
2. Tocá el botón verde **Code** y después **Download ZIP**.
3. Buscá el archivo `.zip` en tu carpeta de Descargas y **extraelo** (clic derecho → *Extraer todo*). No lo abras desde adentro del zip.
4. Movela a un lugar fácil de recordar, por ejemplo `Documentos\padawan-protocol`.

> [!WARNING]
> **Siempre vas a trabajar en esta misma carpeta.** Si la próxima vez abrís tu agente en otra, es como si nada de lo que hicimos existiera. Anotá dónde la dejaste. Más detalles en [FASES.md](../FASES.md).

## Paso 3 — Instalá el agente

### Camino A (el más simple, sin terminal): la app de escritorio de Claude

1. Descargá el instalador desde la [página oficial de descargas](https://claude.com/download), para Windows o Mac, y ejecutalo.
2. Abrí **Claude** (en Windows, desde el menú Inicio; en Mac, desde Aplicaciones) e **iniciá sesión** con tu cuenta.
3. Arriba, en el centro, tocá la pestaña **Code**. Si te pide actualizar de plan, volvé al Paso 1.

La app de escritorio ya incluye el agente: no necesitás instalar nada más.

### Camino B: en la terminal

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

**Con la app de escritorio:** en la pestaña **Code**, elegí **Local**, tocá **Select folder** y elegí la carpeta del Paso 2.

**Con la terminal:** andá a la carpeta del Paso 2 y escribí `claude` ahí. Si no sabés cómo "ir" a una carpeta, pedile ayuda a la [guía de terminal](https://code.claude.com/docs/en/terminal-guide).

**Un consejo para el principio:** en la app de escritorio, al lado del botón de enviar hay un selector del *modo de permisos*. Elegí **Manual**: así el agente te pide confirmación antes de editar archivos o ejecutar comandos, y vos ves qué va a cambiar. Es lo que conviene mientras estás aprendiendo.

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
| Al tocar **Code** te pide actualizar de plan | Necesitás un plan de pago (Paso 1) |
| Un **error 403** en la pestaña Code | Mirá la [ayuda oficial para errores de autenticación](https://code.claude.com/docs/en/desktop#403-or-authentication-errors-in-the-code-tab) |
| `claude` no se reconoce en la terminal | Cerrá la terminal y abrí una nueva; si sigue, [PROBLEMAS-FRECUENTES.md](../PROBLEMAS-FRECUENTES.md) |
| Cualquier otra cosa | Anotalo con [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md) |

## Checkpoint

- [ ] Tengo un plan que incluye el agente.
- [ ] La carpeta de la guía está extraída en un lugar que recuerdo.
- [ ] Mi agente está instalado y con la sesión iniciada.
- [ ] Abrí la carpeta de la guía con el agente.
- [ ] Mandé el primer mensaje y el agente empezó el Nivel 00.
