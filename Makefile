SHELL = /bin/bash
PYTHON = python3

RED   = \033[1;31m
GREEN = \033[1;32m
YELLOW= \033[1;33m
BLUE  = \033[1;34m
CYAN  = \033[1;36m
WHITE = \033[1;37m
RESET = \033[0m

.PHONY: run fix clean backup all

# ---- RUN UTAMA (LEWAT RUN.PY) ----
run: 
	@clear
	@echo -e "${CYAN}"
	@echo "     ██╗███╗   ██╗███████╗███████╗██████╗ ███╗   ██╗ ██████╗     ██╗  ██╗"
	@echo "     ██║████╗  ██║██╔════╝██╔════╝██╔══██╗████╗  ██║██╔═══██╗    ╚██╗██╔╝"
	@echo "     ██║██╔██╗ ██║█████╗  █████╗  ██████╔╝██╔██╗ ██║██║   ██║     ╚███╔╝ "
	@echo "     ██║██║╚██╗██║██╔══╝  ██╔══╝  ██╔══██╗██║╚██╗██║██║   ██║     ██╔██╗ "
	@echo "     ██║██║ ╚████║██║     ███████╗██║  ██║██║ ╚████║╚██████╔╝    ██╔╝ ██╗"
	@echo "     ╚═╝╚═╝  ╚═══╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝"
	@echo -e "${RESET}"
	@echo -e "${ORANGE}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${GREEN}     [✔] INFERNO-X - PREMIUM LAUNCHER V1.0${RESET}"
	@echo -e "${CYAN}     [i] Initializing System...${RESET}"
	@echo -e "${ORANGE}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo ""
	@${PYTHON} run.py

# ---- FIX PYTHON ----
fix:
	@clear
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${YELLOW}  [⚠] Python 3.14 Detected. Running System Fix...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo ""
	@bash python313.sh
	@echo -e "${GREEN}  [✔] System Fix Complete. Run 'make run' to start.${RESET}"

# ---- CLEANUP ----
clean:
	@clear
	@echo -e "${CYAN}"
	@echo "  ╔══════════════════════════════════════════════════════════════╗"
	@echo "  ║       🧹  INFERNO-X - MAINTENANCE UTILITY                 ║"
	@echo "  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${RESET}"
	@echo -e "${YELLOW}  [i] Scanning for temporary files...${RESET}"
	@echo -e "${CYAN}  ────────────────────────────────────────────────────────────${RESET}"
	@rm -f *.bin.bak *.pyc 2>/dev/null || true
	@rm -rf __pycache__ 2>/dev/null || true
	@rm -f PhizngModifiCation.zip 2>/dev/null || true
	@echo -e "${GREEN}  [✔] System Cleaned & Optimized.${RESET}"

# ---- BACKUP ----
backup:
	@clear
	@echo -e "${CYAN}"
	@echo "  ╔══════════════════════════════════════════════════════════════╗"
	@echo "  ║       📦  INFERNO-X - DATA BACKUP                          ║"
	@echo "  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${RESET}"
	@if [ -f "INFERNO.bin" ]; then \
		echo -e "${YELLOW}  [i] Backing up INFERNO.bin...${RESET}"; \
		cp INFERNO.bin INFERNO.bak.bin; \
		echo -e "${GREEN}  [✔] Backup saved as INFERNO.bak.bin${RESET}"; \
	else \
		echo -e "${RED}  [✘] Error: INFERNO.bin not found!${RESET}"; \
	fi

# ---- ALL ----
all: clean backup run
