# 🎨 Cómo diseñamos lo que se ve en la terminal

Cuando tu agente te explica algo en la terminal, lo hace con un dibujo corto y siempre igual. Esta guía cuenta las reglas que sigue, para que vos puedas pedir lo mismo o hacer el tuyo.

## Las reglas

1. **Una idea por bloque.** Cada bloque tiene un título corto y como máximo 3 líneas.
2. **Un solo próximo paso.** Toda explicación cierra con una acción concreta, marcada en negrita y subrayada.
3. **Tono calmo.** Se dice "es normal", "anotalo y seguí", nunca "no te olvides" ni "no empieces de cero".
4. **Estructura quieta, color con significado.** Cajas y flechas son blancas, y la letra de adentro tiene otro color. El color solo dice algo:

   | Estilo | Qué significa |
   |---|---|
   | Negrita + cian brillante | Título de la caja |
   | Cian más oscuro, sin negrita | Subtítulo dentro de la caja |
   | Amarillo | Estás acá |
   | Verde | Hecho |
   | Gris | Pendiente |
   | Cursiva | Un consejo |
   | Negrita + subrayado | El próximo paso |

5. **El color nunca va solo.** Siempre hay un símbolo (`✓ ● ○`) o un relleno distinto (`█ ▓ ▒ ░`), así se entiende también sin color.
6. **Sin rojo ni alarmas.** Si algo falla, se dice con calma y se ofrece el siguiente paso.

## Las herramientas

| Script | Qué dibuja |
|---|---|
| `scripts/dibujar-flujo.ps1` | Un flujo de pasos, con el actual marcado |
| `scripts/dibujar-tarjeta.ps1` | Dos cajas: texto a la izquierda; flujo y reparto en % a la derecha |

La tarjeta lee su contenido de un archivo `.json`. Hay un ejemplo en `scripts/ejemplos/tarjeta-lorem.json`: copialo y cambiá los textos.

```
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\dibujar-tarjeta.ps1 -Datos scripts\ejemplos\tarjeta-lorem.json
```

Si tu terminal no muestra bien el color o los símbolos, agregá `-SinColor` o `-Ascii`.

> [!NOTE]
> La fuente (el tipo de letra) la define tu terminal, no el script. Lo que sí cambia el script es el estilo: negrita, cursiva, subrayado y color. Si la negrita no se nota (algunas terminales solo aclaran el color), buscá en su configuración la opción de texto intenso y elegí "negrita".
