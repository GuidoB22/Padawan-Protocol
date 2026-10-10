#!/usr/bin/env bash
# Chequeo de estado de Padawan Protocol (Mac / Linux)
#
# Revisa que hay armado en esta carpeta y lo muestra en colores:
# verde = listo, gris = todavia no, amarillo = instalado pero mal configurado.
# No modifica nada -- es de solo lectura.

GREEN='\033[0;32m'
GRAY='\033[0;90m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${CYAN}Chequeo de estado -- Padawan Protocol${NC}"
echo -e "${CYAN}=====================================${NC}"
echo ""

show_check() {
  local label="$1"
  local path="$2"
  if [ -e "$path" ]; then
    echo -e "  ${GREEN}[OK] $label${NC}"
  else
    echo -e "  ${GRAY}[ ]  $label${NC}"
  fi
}

show_check "Nivel 00 -- contexto (quien-soy.md)" "quien-soy.md"
show_check "Nivel 02 -- memoria persistente (memoria.md)" "memoria.md"
show_check "Nivel 03 -- Obsidian abierto (.obsidian/)" ".obsidian"
show_check "Plugin Dataview" ".obsidian/plugins/dataview"
show_check "Plugin Git (obsidian-git)" ".obsidian/plugins/obsidian-git"
show_check "Plugin Local REST API (MCP)" ".obsidian/plugins/obsidian-local-rest-api"

DATA_JSON=".obsidian/plugins/obsidian-local-rest-api/data.json"
if [ -f "$DATA_JSON" ]; then
  if grep -q '"enableInsecureServer"[[:space:]]*:[[:space:]]*true' "$DATA_JSON"; then
    PORT=$(grep -o '"insecurePort"[[:space:]]*:[[:space:]]*[0-9]*' "$DATA_JSON" | grep -o '[0-9]*$')
    echo -e "  ${GREEN}[OK] Servidor HTTP del MCP habilitado (puerto ${PORT})${NC}"
  else
    echo -e "  ${YELLOW}[!]  Servidor HTTP del MCP DESHABILITADO -- ver PROBLEMAS-FRECUENTES.md${NC}"
  fi
  if git ls-files --error-unmatch "$DATA_JSON" >/dev/null 2>&1; then
    echo -e "  ${YELLOW}[!]  La clave del MCP (data.json) esta versionada en git -- sacala con: git rm --cached \"$DATA_JSON\"${NC}"
  fi
fi

echo ""
echo -e "${GRAY}Esto es solo un vistazo rapido -- tu agente decide con vos que nivel sigue.${NC}"
echo ""
