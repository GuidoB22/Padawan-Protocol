# Problemas frecuentes

Se arma con lo que va apareciendo en Discord y en los issues de GitHub — cada vez que algo se repite, queda anotado acá con su solución, para que el siguiente no se trabe con lo mismo.

**Para el agente**: antes de decirle a la persona "esto no lo había visto", buscá acá primero — puede que ya tenga solución conocida.

---

## "El agente/la persona se dispersa y no termina de configurar todo"

**Síntoma**: se termina un paso (ej. instalar Obsidian) y la conversación se queda ahí, como si ya hubiera terminado — la persona sigue usando la IA para charla normal en vez de seguir con el próximo nivel.

**Causa**: el agente esperaba que la persona dijera "seguí" en vez de continuar solo.

**Solución**: ya corregido en la guía — ver Regla dura #8 de `INSTRUCCIONES-AGENTE.md`. Si tu agente lo sigue haciendo pese a tener la versión actualizada (Regla dura #7 de chequeo de versión), reportalo — puede ser un caso nuevo no cubierto.

---

## "Abrí el agente de nuevo y no se acuerda de nada, aunque ya habíamos avanzado"

**Síntoma**: una sesión nueva actúa como si fuera la primera vez — no encuentra `memoria.md` ni `quien-soy.md`, aunque juraste que ya los habías creado.

**Causa más común, casi siempre esta**: el agente se abrió en una carpeta DISTINTA a la de la guía — no es que se haya "olvidado", es que está mirando un lugar equivocado de tu computadora.

**Solución**: ver Nivel 01, sección "No perder tu carpeta" — hay que abrir el agente exactamente en la misma carpeta siempre. Si no estás seguro de cuál es, buscá en tu computadora un archivo llamado `quien-soy.md` (usá el buscador de archivos de tu sistema) — la carpeta donde esté ese archivo es la correcta.

---

## "Instalé el plugin de Local REST API pero el MCP no conecta"

**Síntoma**: el plugin queda instalado y activado, pero el MCP no conecta — parece que "el puerto no escucha", aunque Obsidian esté abierto y todo lo demás bien instalado. Hay DOS causas distintas, no una sola, y suelen aparecer una después de la otra:

**Causa 1 — probaste el puerto HTTPS (27124)**: ese puerto usa un certificado que el propio plugin se firma a sí mismo (no lo emite una autoridad reconocida) — la mayoría de los clientes MCP lo rechazan por eso, no porque el servidor esté caído.
→ **Solución**: usar el puerto HTTP 27123 (`http://127.0.0.1:27123/mcp/`) en vez del 27124.

**Causa 2 — probaste el 27123 y tampoco respondía nada**: el plugin trae el servidor sin cifrar (HTTP) APAGADO por defecto — no es que el puerto esté mal, es que directamente no está escuchando en ningún puerto sin cifrar hasta que se activa esa opción.
→ **Solución**: en `.obsidian/plugins/obsidian-local-rest-api/data.json` confirmar que `"enableInsecureServer"` esté en `true` (el agente puede escribirlo antes de que abras Obsidian por primera vez), o si ya abriste Obsidian antes de eso, activarlo a mano desde Obsidian → Settings → Community plugins → Local REST API → toggle del servidor sin cifrar.

Ver Nivel 03, sección de conexión MCP, para el detalle completo de las dos causas.

---

## "En Linux instalé el agente pero la terminal dice `command not found`"

**Síntoma**: el instalador terminó bien, pero al escribir el nombre del agente (por ejemplo `claude`) la terminal no lo encuentra.

**Causa**: el instalador agregó el programa a una carpeta que la terminal abierta todavía no conoce. Solo la "ve" una terminal nueva.

**Solución**: cerrá la terminal y abrí una nueva. Si sigue igual, pedile a tu agente (desde otra terminal o en tu otra compu) que agregue la carpeta del instalador al `PATH` en `~/.bashrc`. Ver [guias/linux-mint.md](guias/linux-mint.md).

---

## "Pegué una clave o una contraseña en el chat con mi agente"

**Síntoma**: en un apuro, escribiste o pegaste una API key, un token o una contraseña en la conversación.

**Causa**: pasa seguido, porque es natural "pasarle todo" al agente. Pero lo que escribís en el chat queda guardado en el historial de esa conversación.

**Solución**: considerá esa clave como **ya no secreta**. Revocala en la página del servicio, creá una nueva y cargala solo en tu terminal, nunca en el chat. Un agente bien configurado no te la pide, y si te la pide, es señal para frenar. Ver el apartado "Si pegaste la clave por error" del [caso 03](casos-de-uso/03-mcp-con-api-key.md).

---

## "Mi agente dice que no puede ejecutar nada, o se queda trabado con los permisos"

**Síntoma**: el agente intenta correr un comando o editar un archivo y recibe un error del estilo "no se pudo verificar el permiso" o "acción bloqueada", aunque antes funcionaba. Puede pasar incluso con comandos de solo lectura.

**Causa**: muchos agentes revisan cada acción antes de ejecutarla (con un verificador automático o pidiéndote confirmación). A veces ese verificador falla por un problema del servicio, no por algo que hayas pedido mal. Puede ser pasajero.

**Solución**:

1. Esperá unos minutos y volvé a pedir lo mismo. Muchas veces se arregla solo.
2. Si el agente reintenta una y otra vez, pedile que **pare**: insistir en bucle no ayuda.
3. Si sigue, cambiá el **modo de permisos** del agente desde su propia configuración, para que las acciones te las pida a vos. Eso lo cambiás vos, no el agente: no le pidas que se dé permisos a sí mismo.
4. No aceptes "permitir todo" sin entender qué estás aprobando.
