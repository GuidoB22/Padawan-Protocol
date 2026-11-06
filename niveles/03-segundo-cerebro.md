# 🧭 Nivel 03 — Segundo cerebro

## Memoria vs. base de conocimiento — no es lo mismo

La memoria del Nivel 02 es chica y cronológica: "qué pasó la última vez". Un **segundo cerebro** es distinto: es una base de conocimiento organizada POR TEMA, que crece con el tiempo y no se borra ni se resume — cada nota vive, y se conecta con otras notas relacionadas.

```mermaid
flowchart LR
    subgraph Cerebro["Segundo cerebro"]
        N1[Nota: Tema A] -- link --> N2[Nota: Tema B]
        N1 -- link --> N3[Nota: Tema C]
    end
```

## La convención mínima

No hace falta una app especial para que esto funcione. Alcanza con:

- Una carpeta.
- Un archivo markdown por tema.
- Un encabezado simple arriba de cada nota (de qué trata, cuándo la tocaste por última vez).
- Links entre notas relacionadas.

Mirá `plantillas/segundo-cerebro/_ejemplo-nota.md` para ver la forma mínima.

## Instalando Obsidian — recomendado, te lo va a hacer mucho más cómodo de ver

Los archivos de texto de arriba andan igual sin esto — pero una app te deja VER las notas con formato lindo y las conexiones entre ellas dibujadas, en vez de abrir cada `.md` a mano.

Tu agente puede dejar TODO listo de antemano: instala la app, descarga y activa los 2 plugins que usamos, y hasta te abre Obsidian ya parado en tu carpeta. Así te queda solo **1 click tuyo**: aceptar un aviso de seguridad que Obsidian muestra siempre la primera vez. Ese aviso no se puede saltear con ningún script, y está bien que así sea: es para que una carpeta ajena no pueda correr código sin que vos lo confirmes.

**1. Instalación + plugins ya listos — esto lo hace tu agente entero, vos solo le das el "sí" antes de que instale:**

```
Antes de instalar nada, decime el comando exacto, qué cambia y
cómo deshacerlo (desinstalarlo), y esperá mi "sí" (Regla #16).
Instalá Obsidian en esta computadora (winget en Windows, brew
--cask en Mac, o el método que corresponda a mi Linux si es
otro — preguntame antes si no tenés Homebrew). Después, en esta
misma carpeta, dejá pre-instalados y habilitados los plugins
Dataview (blacksmithgu/obsidian-dataview) y Git (Vinzent03/obsidian-git):
descargá los archivos de su último release de GitHub a
.obsidian/plugins/dataview/ y .obsidian/plugins/obsidian-git/,
y agregá sus IDs a .obsidian/community-plugins.json. Avisame
cuando todo esto esté listo.
```

**2. Obsidian se abre solo, ya en tu carpeta — esto también lo hace tu agente (🧪 en prueba):**

Elegir una carpeta dentro de Obsidian confunde a casi todo el mundo: parece que hay que elegir un archivo, y no. Por eso se lo dejás a tu agente. Lo que hace es anotar tu carpeta en la lista de "lugares conocidos" de Obsidian y después abrirla con un link especial, como cuando guardás un contacto en el celular y después lo llamás con un toque.

```
Ahora abrime Obsidian ya parado en esta carpeta, sin que yo tenga
que buscarla. Esto cambia un archivo de Obsidian que está fuera de
esta carpeta, así que antes decime qué vas a hacer y esperá mi
"sí" (Regla #16). Pasos:
1) Fijate que Obsidian esté cerrado. Si está abierto, pedime que
   lo cierre (abierto no relee su lista y no funciona).
2) Guardá una copia del archivo obsidian.json, que es la lista de
   carpetas de Obsidian (Windows: %APPDATA%\obsidian\ — Mac:
   ~/Library/Application Support/obsidian/ — Linux:
   ~/.config/obsidian/). Esa copia es cómo se deshace.
3) Agregá esta carpeta a esa lista sin borrar lo que ya esté: un
   id nuevo de 16 caracteres hexadecimales, con "path" (la ruta
   completa de esta carpeta) y "ts" (la hora actual en
   milisegundos). Si el archivo no existe, crealo con
   {"vaults":{...}}.
4) Abrí el link obsidian://open?path=<ruta de esta carpeta,
   codificada para URL>.
Si Obsidian no se abre en esta carpeta, devolvé la copia del paso
2 y guiame con el camino manual.
```

**3. El único click que te queda a vos:**

- **Confirmar que confiás en los plugins.** Cuando Obsidian se abra, te va a preguntar si confiás en el autor de esta carpeta, porque ya trae plugins con código adentro. Guía oficial: [obsidian.md/help/community-plugins](https://obsidian.md/help/community-plugins). Como la armaste vos (con tu agente), confiá y aceptá.

**¿No se abrió solo?** Pasa a veces, no hiciste nada mal. Abrí Obsidian vos y elegí "Open folder as vault" (abrir carpeta como vault). Ojo: ahí se elige la **carpeta** entera, no un archivo de adentro. Entrás a la carpeta y tocás "Seleccionar carpeta". Guía oficial: [obsidian.md/help/vault](https://obsidian.md/help/vault) (sección "Open existing folder").

Esos links son la documentación OFICIAL de Obsidian. Son de texto, sin capturas de pantalla (así la mantiene Obsidian). Si no entendés qué estás viendo en tu pantalla, describíselo a tu agente y que te oriente.

> [!TIP]
> 🧭 **Decile esto a tu agente (después de tu click):**
>
> ```
> Ya se abrió Obsidian y confirmé que confío en los plugins.
> Confirmá que ves la carpeta .obsidian/plugins/ con dataview y
> obsidian-git adentro, y contame en una línea para qué sirve
> cada uno con tus propias palabras.
> ```

**¿Preferís no instalar nada por ahora?** Está perfecto — seguí con los archivos de texto plano de arriba, funcionan igual. Podés volver a esto cuando quieras.

## Conectar tu agente al vault por MCP — para que consulte y escriba por etiqueta, no a ciegas

Esto solo aplica si instalaste Obsidian arriba. Hasta acá, tu agente escribe notas en el vault porque se lo pedís en el chat — pero no puede "preguntarle al vault" cosas como *"traeme todas las notas etiquetadas como pendiente"* ni insertar una nota nueva respetando esas etiquetas, salvo que tenga una conexión dedicada para eso. Esa conexión se llama **MCP** (Model Context Protocol) — un puente estándar entre tu agente y una herramienta externa, en este caso tu propio vault.

**1. Plugin adicional — mismo mecanismo que Dataview/Git de arriba, tu agente lo deja listo:**

```
Además de Dataview y Git, dejá pre-instalado y habilitado el plugin
Local REST API (coddingtonbear/obsidian-local-rest-api) en esta
carpeta, con el mismo método que los otros dos. Antes de conectar
nada, verificá que la versión instalada sea 4.1.3 o más nueva —
versiones anteriores tienen una falla de seguridad ya corregida
(path traversal, GHSA-62gx-5q78-wrvx). Si el release que bajaste
es más viejo, avisame antes de seguir.

Este plugin trae el servidor HTTP simple (sin certificado) APAGADO
por defecto — solo enciende el HTTPS con certificado propio, que la
mayoría de clientes MCP van a rechazar. Para que esto funcione con
el mínimo de clicks, escribí ya el archivo
.obsidian/plugins/obsidian-local-rest-api/data.json con el contenido
{"enableInsecureServer": true} ANTES de que yo abra Obsidian por
primera vez — así el plugin arranca con el servidor simple ya
prendido, sin que yo tenga que tocar ningún toggle en sus ajustes.
```

**2. Después de que Obsidian se abra y confirmes que confiás en los plugins, decile esto a tu agente:**

```
Ya abrí el vault con el plugin Local REST API activado. Este plugin
genera automáticamente una clave de acceso la primera vez que corre
— buscala en .obsidian/plugins/obsidian-local-rest-api/data.json y
usala para conectarte a mí mismo por MCP. Usá el puerto HTTP 27123
(http://127.0.0.1:27123/mcp/), NO el HTTPS 27124 — ese segundo
puerto usa un certificado que el plugin se firma a sí mismo, y la
mayoría de los clientes MCP lo rechazan por no ser de una autoridad
confiable. Antes de intentar conectar, confirmá en ese mismo
data.json que "enableInsecureServer" quedó en true — si sigue en
false (podés haberlo pisado si abriste Obsidian antes de que yo
escribiera el archivo), cambialo ahí o desde Obsidian → Settings →
Local REST API → activá el toggle del servidor sin cifrar, y recién
ahí el puerto 27123 va a responder. Una vez conectado, probá una
consulta simple para confirmar que funciona.
```

Tu agente sabe cómo agregar un servidor MCP por HTTP en su propia herramienta (el comando exacto cambia según si es Claude Code, Codex CLI, u otro) — no hace falta que vos sepas el comando, pedíselo y que lo resuelva.

> [!TIP]
> 🧭 **Decile esto a tu agente (prueba rápida, apenas conectes):**
>
> ```
> Escribí, por MCP (no escribiendo el archivo directo), una nota
> de prueba llamada conexion-mcp-ok.md con el texto "Conexión MCP
> verificada: [fecha de hoy]". Después leela también por MCP.
> Confirmame que el contenido que leíste coincide exactamente.
> ```
>
> Esto prueba la conexión en sí, sin depender de que ya tengas notas o etiquetas armadas — la prueba más completa (con etiquetas reales) viene un poco más abajo.

**¿Ya intentaste esto y no conectó?** Hay dos causas posibles, no una sola:

1. **Probaste el puerto 27124 (HTTPS)** — ese puerto usa un "certificado autofirmado" (una credencial de seguridad que el propio plugin se inventa a sí mismo, en vez de una emitida por una autoridad reconocida) y la mayoría de los agentes lo rechazan por eso. Solución: usar 27123.
2. **Probaste el 27123 y tampoco respondía nada** — este plugin trae APAGADO por defecto el modo simple, sin ese certificado (tranquilo: sigue siendo seguro, porque solo funciona dentro de tu propia computadora, nunca expuesto a internet). Si por algún motivo no quedó activado (por ejemplo, si Obsidian ya había corrido una vez antes de que tu agente escribiera `data.json`), el puerto directamente no va a escuchar, sin importar a cuál apuntes. Andá a Obsidian → Settings (⚙️) → Community plugins → Local REST API, y activá manualmente la opción de servidor sin cifrar (HTTP) — recién ahí 27123 responde.

**3. La parte que realmente importa: etiquetas consistentes, no un caos de tags distintos**

Que tu agente pueda *consultar* el vault por MCP no sirve de mucho si cada nota usa una etiqueta distinta para lo mismo. La convención que hace que esto funcione de verdad:

- Cada nota lleva unas pocas etiquetas fijas en su encabezado (de qué tema es, en qué estado está — por ejemplo "en progreso" o "cerrado").
- Tu agente NO inventa una etiqueta nueva cada vez que se le ocurre una — reusa las que ya existen, salvo que decidan juntos crear una categoría nueva de verdad.
- Antes de escribir una nota nueva, tu agente consulta qué etiquetas ya existen (por MCP, o leyendo unas pocas notas de ejemplo) en vez de adivinar.

Esa disciplina — pocas etiquetas, reusadas siempre igual, consultables por tu agente — es lo que convierte un montón de archivos sueltos en una base de conocimiento que de verdad se puede interrogar.

> [!TIP]
> 🧭 **Decile esto a tu agente (para probar que la conexión + etiquetas funcionan juntas):**
>
> ```
> Buscá en el vault, por MCP, todas las notas que tengan la etiqueta
> "[una etiqueta real de tu segundo cerebro]". Contame cuáles encontraste.
> Después creá una nota nueva de prueba con esa misma etiqueta, insertada
> por MCP (no escribiendo el archivo directo) — y confirmame que la
> etiqueta que usaste ya existía antes, no la inventaste ahora.
> ```

**¿No te interesa esto todavía?** No hace falta — tu agente sigue pudiendo leer y escribir notas como hasta ahora, solo que pidiéndoselo directo en el chat en vez de por consulta estructurada. Podés volver a esto más adelante.

## Acción

Elegí un tema real que te importe (no tiene que ser grande). Pedile al agente que cree la primera nota siguiendo la convención, y una segunda nota sobre algo relacionado, linkeada a la primera.

## Checkpoint

Días después (o ahora mismo, simulando), preguntale al agente algo sobre ese tema — tiene que poder buscar en las notas y responder con lo que ahí escribiste, no inventar.

**Prueba:** en `segundo-cerebro/` están las dos notas, la segunda con un link a la primera, y tu agente te dice de qué nota sacó cada dato. Si instalaste Obsidian, el chequeo de estado (Regla #12) muestra `[OK]` en `Nivel 03 -- Obsidian abierto (.obsidian/)` y en los plugins.

---

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Quiero armar mi segundo cerebro. Elegí el tema "[tu tema real acá]".
> Creá una carpeta segundo-cerebro/ si no existe, y adentro una nota
> sobre ese tema siguiendo la convención de plantillas/segundo-cerebro/.
> Después creá una segunda nota sobre [un tema relacionado], linkeada
> a la primera. Cuando termines, preguntame qué sé sobre el tema
> buscando en esas notas, para confirmar que funciona.
> ```
