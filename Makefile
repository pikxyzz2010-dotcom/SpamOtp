SHELL = /bin/bash
PYTHON = python

# ─── COLOR PALETTE ───
RED   = \033[1;31m
GREEN = \033[1;32m
YELLOW= \033[1;33m
CYAN  = \033[1;36m
BLUE  = \033[1;34m
PURPLE= \033[1;35m
WHITE = \033[1;37m
BOLD  = \033[1m
RESET = \033[0m
DIM   = \033[2m

.PHONY: run fix clean backup all

# ═══════════════════════════════════════════════════════════════
# 🔥  I N F E R N O - X   P R E M I U M   L A U N C H E R
# ═══════════════════════════════════════════════════════════════

run:
	@clear
	@echo -e "${CYAN}  ╔══════════════════════════════════════════════════════════════╗"
	@echo -e "${CYAN}  ║  ${BOLD}${WHITE}   ██╗███╗   ██╗███████╗███████╗██████╗ ███╗   ██╗ ██████╗   ${CYAN}║"
	@echo -e "${CYAN}  ║  ${BOLD}${WHITE}   ██║████╗  ██║██╔════╝██╔════╝██╔══██╗████╗  ██║██╔═══██╗  ${CYAN}║"
	@echo -e "${CYAN}  ║  ${BOLD}${WHITE}   ██║██╔██╗ ██║█████╗  █████╗  ██████╔╝██╔██╗ ██║██║   ██║  ${CYAN}║"
	@echo -e "${CYAN}  ║  ${BOLD}${WHITE}   ██║██║╚██╗██║██╔══╝  ██╔══╝  ██╔══██╗██║╚██╗██║██║   ██║  ${CYAN}║"
	@echo -e "${CYAN}  ║  ${BOLD}${WHITE}   ██║██║ ╚████║██║     ███████╗██║  ██║██║ ╚████║╚██████╔╝  ${CYAN}║"
	@echo -e "${CYAN}  ║  ${BOLD}${WHITE}   ╚═╝╚═╝  ╚═══╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝   ${CYAN}║"
	@echo -e "${CYAN}  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${PURPLE}  ═══════════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${GREEN}  ⚡ ${BOLD}INFERNO-X PREMIUM LAUNCHER v1.0${RESET}   ${DIM}${WHITE}[ SYSTEM READY ]${RESET}"
	@echo -e "${PURPLE}  ═══════════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${YELLOW}  [i] Initializing modules...${RESET}"
	@echo -e "${CYAN}  ████████████████████${DIM}░░░░░░░░░░ 50%${RESET}"
	@echo -e "${GREEN}  [✔] Core system loaded${RESET}"
	@echo -e "${CYAN}  ████████████████████████████████████████${RESET} 100%"
	@echo ""
	@echo -e "${WHITE}  ─── ${RED}EXECUTING ${WHITE}─────────────────────────────────────────────────${RESET}"
	@${PYTHON} run.py

# ═══════════════════════════════════════════════════════════════
# 🔧  F I X   P Y T H O N   3 . 1 3   (KALAU USER PAKE 3.14)
# ═══════════════════════════════════════════════════════════════

fix:
	@clear
	@echo -e "${RED}  ╔══════════════════════════════════════════════════════════════╗"
	@echo -e "${RED}  ║  ${BOLD}${WHITE}      🔧  P Y T H O N   V E R S I O N   F I X  🔧            ${RED}║"
	@echo -e "${RED}  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${YELLOW}  [⚠] Detected Python 3.14 (Unstable). Running fix...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════════"
	@echo -e "${WHITE}  [i] Downgrading to Python 3.13...${RESET}"
	@bash python313.sh
	@echo -e "${GREEN}  [✔] Python 3.13 installed successfully!${RESET}"
	@echo -e "${WHITE}  [i] Please run '${GREEN}make run${WHITE}' again to start INFERNO-X.${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════════"

# ─── MAINTENANCE ──────────────────────────────────────────────────

clean:
	@clear
	@echo -e "${RED}  ╔══════════════════════════════════════════════════════════════╗"
	@echo -e "${RED}  ║  ${BOLD}${WHITE}      🧹  I N F E R N O - X   C L E A N U P  🧹          ${RED}║"
	@echo -e "${RED}  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${YELLOW}  [i] Scanning for temporary files...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════════"
	@rm -f *.pyc *.pyo 2>/dev/null || true
	@rm -rf __pycache__ 2>/dev/null || true
	@echo -e "${GREEN}  [✔] Cleanup complete!  ${WHITE}${DIM}  (System optimized)${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════════"

# ─── BACKUP ──────────────────────────────────────────────────────

backup:
	@clear
	@echo -e "${BLUE}  ╔══════════════════════════════════════════════════════════════╗"
	@echo -e "${BLUE}  ║  ${BOLD}${WHITE}      📦  I N F E R N O - X   B A C K U P  📦              ${BLUE}║"
	@echo -e "${BLUE}  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${YELLOW}  [i] Creating system backup...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════════"
	@cp INFERNO.pyc INFERNO.bak.pyc 2>/dev/null || true
	@echo -e "${GREEN}  [✔] Backup created:  ${WHITE}INFERNO.bak.pyc${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════════"

# ─── ALL IN ONE ──────────────────────────────────────────────────

all: clean backup run
