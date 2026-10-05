# 🧭 Caso 02 — Ingesta de proyecto

**Requiere: Nivel 03.** Tiempo estimado: 20 a 30 minutos para armar el circuito.

## El problema

La información de un proyecto está desparramada: mails, chats, notas de reuniones, páginas web. Es como tener los papeles de una mudanza en diez cajas distintas. La idea es una sola caja de entrada, y que tu agente ordene el contenido en tu vault.

No necesitás saber de sistemas. Todo se reduce a **guardar el material como archivo en una carpeta**. Y **tu agente también puede hacer todo esto por vos**: crear carpetas, ordenar, etiquetar.

> [!WARNING]
> **Privacidad antes de empezar.** No metas datos personales sensibles de terceros ni mails confidenciales de tu empresa en lugares que se puedan subir a git o compartir. Consultá la política de tu empresa sobre usar un agente de IA con datos de la empresa. Y mantené esta carpeta fuera del control de versiones (git): pedile a tu agente que la agregue al `.gitignore`. Ojo: las **notas** que salen de ese material también contienen esa información, así que si tu vault se sube a git (Nivel 06), asegurate de que el repositorio sea privado o dejá esas notas afuera.

## Paso 1 — La carpeta de entrada

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Creá la carpeta entrada/[nombre del proyecto]/ y la carpeta
> procesado/[nombre del proyecto]/. Agregá entrada/ y procesado/ al
> archivo .gitignore para que nunca se suban a git. Confirmame que
> quedó hecho.
> ```

## Paso 2 — Meter material, con palabras simples

- **Mails:** usá "Guardar como" y elegí PDF, o arrastrá el mail a la carpeta (queda un archivo `.eml`).
- **Cualquier otra cosa** (chats, páginas web, notas de reunión): seleccioná el texto, pegalo en un archivo del Bloc de notas y guardalo como `.txt` dentro de `entrada/[proyecto]/`.
- **Nombre del archivo, con fecha:** `AAAA-MM-DD-asunto.txt`, por ejemplo `2026-10-05-reunion-cliente.txt`. Así queda ordenado solo.

## Paso 3 — Que tu agente lo lea y lo ordene

Reusá la convención del Nivel 03: pocas etiquetas, siempre las mismas, y antes de crear una nueva se revisan las que ya existen.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Leé todo lo que hay en entrada/[proyecto]/. Por cada tema,
> creá o actualizá UNA nota en mi vault, con etiquetas. Antes de
> crear una etiqueta, mirá cuáles ya existen y reusalas. Cuando
> termines con un archivo, movelo a procesado/[proyecto]/ para que
> no se lea dos veces. Al final decime qué notas creaste o
> actualizaste.
> ```

## Paso 4 — Preguntar "¿en qué quedó?"

Con el material adentro del vault, ya no hace falta buscar mail por mail.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Buscá en mi vault todo lo que hay sobre [proyecto] y decime en
> qué quedó: qué se decidió, qué está pendiente y quién tiene que
> hacer qué. Si algo no aparece en las notas, decímelo; no lo
> inventes.
> ```

## Rutina

Cada vez que llegue algo nuevo: lo guardás en `entrada/[proyecto]/`, le decís a tu agente *"procesá lo nuevo de entrada"*, y listo.

## Checkpoint

- [ ] Existen `entrada/[proyecto]/` y `procesado/[proyecto]/`, ambas en `.gitignore`.
- [ ] Guardé al menos 2 archivos con nombre `AAAA-MM-DD-asunto`.
- [ ] Mi agente creó notas con etiquetas que ya existían y movió los archivos a `procesado/`.
- [ ] Le pregunté "¿en qué quedó [proyecto]?" y la respuesta salió de mis notas.
