# 📷 Pantallazos de la guía visual

Esta carpeta guarda las fotos de pantalla de la [guía visual paso a paso](../guia-visual-instrucciones-fijas.html). Cuando ponés un PNG acá con el nombre exacto de la tabla, la guía lo muestra solo. No hay que tocar código.

## Reglas

1. **Formato PNG.** Un pantallazo por paso.
2. **Tapá tus datos antes de guardar:** nombre, mail, foto de perfil y cualquier chat que no sea de la prueba.
3. **Mismo nombre que en la tabla**, en minúsculas y sin espacios. Si el nombre no coincide, la guía sigue mostrando "Pantallazo pendiente".
4. **Uno vertical para celular, uno horizontal para compu.** La columna "Dónde" dice cuál.
5. Si en tu pantalla el menú se llama distinto, sacá igual el pantallazo y anotá el nombre real: hay que corregir el texto de la guía.

## Lista

| ✓ | Archivo | App | Tiene que verse | Dónde |
|---|---|---|---|---|
| ☐ | `chatgpt-01-configuracion.png` | ChatGPT | La pantalla de Configuración abierta | Celular |
| ☐ | `chatgpt-02-personalizacion.png` | ChatGPT | Configuración con la opción Personalización a la vista | Celular |
| ☐ | `chatgpt-03-instrucciones.png` | ChatGPT | Instrucciones personalizadas, con el cuadro para escribir | Celular |
| ☐ | `chatgpt-04-pegar-guardar.png` | ChatGPT | El texto corto pegado y el botón para guardar | Celular |
| ☐ | `chatgpt-05-probalo.png` | ChatGPT | Chat nuevo con "hola" y una respuesta corta | Celular |
| ☐ | `gemini-01-configuracion.png` | Gemini | La pantalla de Configuración abierta | Celular |
| ☐ | `gemini-02-informacion-guardada.png` | Gemini | Información guardada (o Contexto personal) | Celular |
| ☐ | `gemini-03-pegar-guardar.png` | Gemini | El texto corto pegado, listo para guardar | Celular |
| ☐ | `gemini-04-probalo.png` | Gemini | Chat nuevo con "hola" y una respuesta corta | Celular |
| ☐ | `claude-01-menu.png` | Claude | Tu nombre o iniciales abajo a la izquierda, con el menú abierto | Compu |
| ☐ | `claude-02-configuracion.png` | Claude | La pantalla de Configuración abierta | Compu |
| ☐ | `claude-03-your-claude.png` | Claude | Your Claude (o Perfil), con el lugar de Instrucciones | Compu |
| ☐ | `claude-04-instrucciones.png` | Claude | El cuadro de Instrucciones con el texto corto pegado | Compu |
| ☐ | `claude-05-probalo.png` | Claude | Chat nuevo con "hola" y una respuesta corta | Compu |
| ☐ | `metaai-01-abrir-chat.png` | Meta AI | WhatsApp con el chat de Meta AI abierto | Celular |
| ☐ | `metaai-02-pegar.png` | Meta AI | El texto pegado con "acordate de esto para la próxima" al final | Celular |
| ☐ | `metaai-03-probalo.png` | Meta AI | El chat con "hola" y una respuesta corta | Celular |

## Cómo marcar dónde tocar (opcional)

Cada paso puede mostrar un círculo que titila sobre el botón a tocar.

1. Abrí `../guia-visual-instrucciones-fijas.html` con un editor de texto.
2. Buscá el paso por el nombre del archivo, dentro del bloque `<script type="application/json" id="steps">`.
3. Cambiá `"hotspot": null` por algo así: `"hotspot": {"x": 70, "y": 12, "w": 20, "h": 6}`.
   - `x` y `y`: dónde empieza el círculo, en % desde la esquina de arriba a la izquierda de la imagen.
   - `w` y `h`: ancho y alto del círculo, en % de la imagen.
4. Guardá y abrí la guía con doble clic para ver si quedó en su lugar.
5. Corré `python -I odd/visual/check_visual.py .` desde la raíz del repo. Tiene que decir `0 failed`.
