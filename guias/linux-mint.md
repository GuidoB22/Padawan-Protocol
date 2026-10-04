# 🐧 Hacer la guía en Linux Mint (máquina virtual o instalado)

> Opcional. Es para quien quiere hacer (o repetir) Padawan Protocol en **Linux** en vez de Windows o Mac: para aprender Linux, para tener una compu "limpia" donde probar sin romper nada, o porque tu proyecto necesita Linux (por ejemplo, para conectarte a placas de electrónica o a Bluetooth).

La guía funciona igual en Linux. Los niveles, los archivos y el chequeo de estado (`scripts/chequeo-estado.sh`) son los mismos. Lo único que cambia es **cómo conseguís el Linux**. Hay dos caminos:

| Camino | Riesgo para tu compu | Cuándo conviene |
|---|---|---|
| **A. Máquina virtual** (Linux adentro de una ventana de tu Windows o Mac) | Ninguno: no toca tu disco | Para probar, aprender o repetir la guía de cero cuantas veces quieras |
| **B. Instalarlo de verdad** (en un disco aparte o al lado de Windows) | Bajo si seguís los cuidados de abajo | Si vas a usar Linux todos los días, o necesitás conectar hardware (USB, Bluetooth) sin vueltas |

Si es tu primera vez con Linux, **empezá por A**.

---

## Antes de cualquiera de los dos: bajar Linux Mint de la página oficial

1. Entrá a **[linuxmint.com](https://linuxmint.com/download.php)** y bajá la edición **Cinnamon** (la principal, la más pulida). Es un archivo `.iso` de unos 3 GB.
2. **Verificá que el archivo no esté dañado.** En la misma página de descarga hay un archivo `sha256sum.txt` con un código largo para cada versión. Comparalo con el de tu archivo:
   - **Windows** (PowerShell, en la carpeta donde lo bajaste): `Get-FileHash .\linuxmint-*.iso -Algorithm SHA256`
   - **Mac/Linux**: `shasum -a 256 linuxmint-*.iso`

   Los dos códigos tienen que ser **idénticos**, letra por letra. Si no coinciden, no lo uses y bajalo de nuevo.

> [!TIP]
> 🧭 **Decile esto a tu agente:**
>
> ```
> Bajé el archivo .iso de Linux Mint de linuxmint.com. Ayudame a
> verificar su código SHA256 contra el sha256sum.txt oficial, y decime
> si coincide antes de seguir.
> ```

---

## Camino A — Máquina virtual (sin riesgo)

Una máquina virtual es una "compu de mentira" que corre adentro de tu compu de verdad. Todo lo que pase adentro queda ahí adentro.

1. Instalá **VirtualBox** (gratis) desde su página oficial: [virtualbox.org](https://www.virtualbox.org/wiki/Downloads).
2. Creá una máquina nueva:
   - **Imagen ISO**: el `.iso` de Mint que bajaste.
   - **Memoria**: 4 GB, o más si tu compu tiene 16 GB.
   - **Disco**: 30 GB.
3. Arrancala y elegí **"Install Linux Mint"**. Como es virtual, "borrar el disco" borra solo el disco de mentira de la máquina virtual, no el tuyo.

⚠️ **Limitación**: conectar cosas reales (placas por USB, Bluetooth) a una máquina virtual es posible pero más complicado, y no siempre funciona. Si tu proyecto depende de hardware, mirá el camino B.

---

## Camino B — Instalarlo de verdad, con un pendrive y Rufus

### Cuidados antes de empezar (no saltear)

- **Hacé una copia** de lo importante de tu compu.
- Si tu Windows tiene **BitLocker** (cifrado de disco), suspendelo antes, o tené a mano la clave de recuperación.
- **Lo más seguro**: instalar Linux en **un disco aparte**. Así no tocás el disco de Windows.

### Grabar el pendrive con Rufus (Windows)

Necesitás un pendrive de **8 GB o más**. **Se borra todo lo que tenga.** No hace falta formatearlo antes: Rufus lo prepara solo.

1. Bajá **Rufus** de su página oficial: [rufus.ie](https://rufus.ie).
2. En Rufus:
   - **Dispositivo**: tu pendrive. Fijate bien la letra para no elegir otro disco.
   - **Elección de arranque**: elegí **"Disco o imagen ISO"** y tocá **SELECCIONAR** para buscar tu `.iso`. Las otras opciones (MS-DOS, FreeDOS) son sistemas viejos que no sirven acá.
   - **Esquema de partición**: **GPT** si tu compu es de los últimos ~10 años (lo normal). **MBR** solo si es muy vieja.
   - El resto, como lo propone Rufus.
3. Tocá **EMPEZAR**. Si te pregunta **"modo ISO o modo DD"**, elegí **DD**: es el que menos problemas da con Mint. Esa pregunta aparece recién después de tocar EMPEZAR.

### Probar antes de instalar

Reiniciá la compu arrancando desde el pendrive (suele ser una tecla al prender: F12, F11, F8 o Esc, según la marca). Mint arranca en **modo prueba**, sin tocar nada de tu disco. Aprovechá para revisar que anden el WiFi, el sonido y el Bluetooth. Si todo anda, ahí sí tocá **"Install Linux Mint"**.

---

## Después: tu agente y la guía en Linux

Ya con Mint andando (en la máquina virtual o instalado), abrí la **Terminal** (`Ctrl+Alt+T`):

1. **Instalá tu agente de código** desde su página oficial. Con Claude Code, por ejemplo:

   ```bash
   curl -fsSL https://claude.ai/install.sh | bash
   ```

   Con Codex CLI u otro agente, seguí las instrucciones para Linux de su página. Si después de instalarlo la terminal dice `command not found`, cerrala y abrila de nuevo.

2. **Traé esta guía** y entrá a su carpeta:

   ```bash
   sudo apt install -y git
   git clone https://github.com/GuidoB22/Padawan-Protocol.git ~/padawan
   cd ~/padawan
   ```

3. Abrí tu agente **en esa carpeta** y arrancá como siempre: con Claude Code, `/onboarding`. Con otro agente, el texto del README ("Leé el archivo INSTRUCCIONES-AGENTE.md…").

> [!NOTE]
> **Probado** el 2026-10-04: el chequeo de estado (`bash scripts/chequeo-estado.sh`) se corrió en un Ubuntu 24.04 limpio, que es la base de Linux Mint 22. Marca bien los niveles hechos y los pendientes, y no modifica nada.
> **No probado todavía**: la instalación completa en VirtualBox, ni un recorrido completo de la guía con un agente que no sea Claude Code. Si lo hacés, contanos cómo te fue (ver [COMO-PEDIR-AYUDA.md](../COMO-PEDIR-AYUDA.md)) y lo sumamos acá.

## Relaciones

- [README](../README.md): cómo arrancar la guía
- [PROBLEMAS-FRECUENTES](../PROBLEMAS-FRECUENTES.md): si algo se traba
- [Nivel 06](../niveles/06-avanzado-opcional.md): versionar con git lo que tu agente edita
