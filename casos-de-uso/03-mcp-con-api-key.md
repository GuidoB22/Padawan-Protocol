# 🧭 Caso 03 — Conectar un servicio externo con MCP

**Requiere: Nivel 03.** Tiempo estimado: 30 a 40 minutos. Usamos solo proveedores oficiales.

> [!WARNING]
> **Este caso está en prueba.** Está armado con la documentación oficial de Microsoft y de Google, pero todavía nadie lo siguió de punta a punta. El Paso A (sin clave) es el más seguro para empezar. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md).

> [!NOTE]
> Los comandos `claude mcp ...` son de Claude Code. Si usás otro agente (Codex, Cursor, etc.), pedile que te diga cuál es el equivalente para agregar un MCP remoto.

## Qué es cada cosa

- **MCP:** un enchufe o adaptador que le permite a tu agente usar otra herramienta o servicio (en el Nivel 03 lo usaste para conectar tu vault).
- **API key:** una clave parecida a una contraseña que identifica quién sos ante un servicio. **Tratala como una contraseña.**

> [!CAUTION]
> **Reglas de seguridad para la clave (Paso B):**
> - NUNCA la pegues en el chat con tu agente. Tu agente no debería pedírtela.
> - NUNCA la guardes en un archivo dentro de una carpeta que se sube a git o se sincroniza con Obsidian.
> - NUNCA la muestres en capturas de pantalla.
> - La escribís **solo vos, en tu propia terminal**; la herramienta la guarda en la configuración local.
> - Para revocarla: borrá la clave en la página Credentials de la consola de Google Cloud.

## Paso A — Calentamiento, sin clave

El MCP oficial de Microsoft Learn es gratis y no pide autenticación. En **tu** terminal:

```
claude mcp add --transport http microsoft_docs_mcp https://learn.microsoft.com/api/mcp
```

Para verificar, corré `claude mcp list` (tiene que aparecer conectado) y preguntale a tu agente algo de Microsoft o Azure; fijate que use la herramienta.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Usando el MCP de Microsoft Learn, explicame en palabras simples
> qué es [un tema de Azure o Microsoft]. Decime qué herramienta
> usaste para buscarlo.
> ```

## Paso B — Con API key: Google Developer Knowledge

Datos tomados de la documentación oficial (developers.google.com/knowledge/mcp). Necesitás un proyecto de Google Cloud.

1. Habilitá la API: `https://console.cloud.google.com/start/api?id=developerknowledge.googleapis.com`
2. En la consola: **Credentials → Create credentials → API key**.
3. Editá la clave y en **API restrictions** elegí "Developer Knowledge API" (si la clave se filtra, el daño queda limitado).
4. En **tu** terminal, reemplazando `TU_API_KEY` por tu clave:

```
claude mcp add google-developer-knowledge --transport http https://developerknowledge.googleapis.com/mcp --header "X-Goog-Api-Key: TU_API_KEY"
```

Ese comando queda guardado en el historial de tu terminal además de en la configuración local: por eso el paso 3 (restringir la clave) no es opcional. Si algún día sospechás que se filtró, revocala y creá otra.

Herramientas que expone: `search_documents`, `get_documents` y `answer_query`. Cubre solo documentación pública, en inglés. Las cuotas se ven en la consola.

> [!WARNING]
> Si en algún momento Google te pide facturación o una tarjeta: **pará, no cargues datos de pago**, quedate con el Paso A y consultalo con una persona de confianza. No verificamos que sea obligatorio.

**Verificá:** preguntale algo concreto sobre una API de Google.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Usando el MCP de Google Developer Knowledge, explicame cómo
> [una pregunta chica sobre Firebase o Cloud Run]. Decime si usaste
> search_documents y qué documento encontraste.
> ```

## Lo que aprendiste vale para tu trabajo

Esto es lo mismo que vas a hacer con Jira, Confluence, Drive o tu correo: **cambia el servicio, no el patrón.** Agregás el MCP, guardás la credencial bien, y probás con una pregunta chica.

Ojo: en herramientas del trabajo, el equipo de IT o seguridad tiene que aprobarlo antes. Y suelen usar una pantalla de inicio de sesión (OAuth) en lugar de una clave.

## Checkpoint

- [ ] `claude mcp list` muestra `microsoft_docs_mcp` conectado y lo probé con una pregunta.
- [ ] (Paso B) Restringí la clave y la escribí solo en mi terminal; nunca en el chat ni en un archivo.
- [ ] Mi agente usó `search_documents` para responder una pregunta de Google.
- [ ] Sé cómo revocar la clave.
