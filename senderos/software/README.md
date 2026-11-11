# 🧭 Sendero del Caballero: tu primer fix en un proyecto open source

> [!WARNING]
> **Este sendero está en prueba, y el nombre es provisorio.** Sale de un ejercicio real, pero todavía nadie nuevo lo siguió de punta a punta. Si algo no coincide con lo que ves en pantalla, confiá en la pantalla y avisanos en [COMO-PEDIR-AYUDA.md](../../COMO-PEDIR-AYUDA.md).

## Para quién es, y qué lográs

Para quien ya programa y lee código, y quiere contribuir a un proyecto open source trabajando con un agente.

**Resultado esperado:** elegir una aplicación simple, levantarla, reproducir un error real, encontrar la causa, proponer un fix y abrir un pull request, con evidencia en cada paso.

Sale de un ejercicio real. Cada lección marcada con 🔴 es un error que ya cometimos, para que no lo repitas.

## El gate

- [ ] Programás y sabés leer código.
- [ ] Tenés Git, Docker, una cuenta de GitHub y `gh` (la CLI de GitHub).
- [ ] Tenés un agente de código trabajando en tu máquina.

¿Todavía no tenés un agente armado? Los [niveles](../../niveles/00-contexto.md) son el camino recomendado para llegar. No son un requisito si ya trabajás con uno.

## Los roles

- **Vos** ejecutás cada comando.
- **Tu agente** pregunta, frena y revisa la evidencia. Rigen las reglas de [INSTRUCCIONES-AGENTE.md](../../INSTRUCCIONES-AGENTE.md): pide un "sí" antes de instalar o cambiar algo fuera de la carpeta, y el código que viene de internet lo leés antes de correrlo.

## Las 8 reglas que valen en todas las misiones

1. **Reproducir antes de tocar código.** Si no ves el error con tus ojos, no sabés si tu fix lo arregla.
2. **Evidencia, no "creo que anda".** Hecho = captura, log o número real, no código que "debería funcionar".
3. **Plan antes de código.** Escribir qué cubre el cambio, qué archivo toca y cómo se verifica.
4. **Dos intentos fallidos sobre el mismo problema → parar.** No hay tercer parche a ciegas: volver a leer, replantear la hipótesis o pedir ayuda.
5. **Cambios chicos.** Un paso por vez, revisable. Un PR chico se revisa y se acepta; uno grande se ignora.
6. **No reinventar la rueda.** Antes de inventar una solución, buscar cómo el propio proyecto ya resuelve algo parecido y copiar ese patrón.
7. **Separar lo verificado de lo supuesto.** En tus notas y en el PR, marcar 🟢 lo probado y 🔴 lo que no.
8. **La IA es una herramienta, no el piloto.** Que te dé un comando por vez, que explique el porqué, y no aceptes un parche que no entendés. Pedile siempre que verifique con comandos en vez de afirmar.

## Preparación (una sola vez)

Verificar que todo responde:

```
git --version
docker --version
gh --version
gh auth status
```

Abrir Docker Desktop y esperar a que diga "running".

Crear una carpeta de trabajo (por ejemplo `C:\Workspace`) y, dentro, un archivo de **bitácora** por ejercicio, copiando la [plantilla](bitacora.plantilla.md). Todo lo que pase se anota ahí: es la memoria del ejercicio y lo que te permite retomar otro día.

**Evidencia a guardar:** la salida de `gh auth status` y las versiones de las herramientas.

## Las misiones

| Misión | Qué lográs |
|---|---|
| [01 — Elegir app e issue](01-elegir-app-e-issue.md) | Elegir app e issue con criterios, y comprobar que el bug no esté ya arreglado |
| [02 — Levantar y reproducir](02-levantar-y-reproducir.md) | Clonar, levantar e instalar la app, y ver el error con tus ojos sin tocar código |
| [03 — Causa y fix](03-causa-y-fix.md) | Cadena causal con archivo y línea, fix chico con plan de tres líneas y pruebas con evidencia |
| 04 — Pull request y después | 🔴 pendiente de escribir |

Se hacen en orden. No se pasa a la siguiente hasta confirmar el checkpoint de la anterior.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Quiero hacer el Sendero del Caballero. Leé senderos/software/README.md
> y el archivo de la misión que me toca, y trabajemos como pares: un
> comando por vez, que lo corro yo. En cada checkpoint pedime la
> evidencia (captura, log o salida del comando) y verificala antes de
> seguir. Mantené mi bitácora al día. Si fallamos dos veces en el
> mismo problema, parate y replanteá en vez de insistir.
> ```

## Checkpoint

- [ ] Cumplo el gate.
- [ ] Leí las 8 reglas y tengo claro que la regla 4 es parar a los dos intentos.
- [ ] `git`, `docker`, `gh` y `gh auth status` responden bien.
- [ ] Docker Desktop dice "running".
- [ ] Tengo mi carpeta de trabajo y mi bitácora copiada de la plantilla.
