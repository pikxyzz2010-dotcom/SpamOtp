SHELL = /bin/bash
TARGET = Ripper.py
PYTHON = python3

RED   = \033[1;31m
GREEN = \033[1;32m
YELLOW= \033[1;33m
BLUE  = \033[1;34m
CYAN  = \033[1;36m
WHITE = \033[1;37m
RESET = \033[0m

.PHONY: run fix clean backup all

# ---- RUN UTAMA (JALANKAN RUN.PY) ----
run: 
	@clear
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${GREEN}  [✔] THE RIPPER - LAUNCHER V5.3${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${YELLOW}  [i] Menjalankan run.py (Auto Installer + Launcher)...${RESET}"
	@echo ""
	@${PYTHON} run.py

# ---- FIX PYTHON (HANYA JALANKAN PYTHON313.SH) ----
fix:
	@clear
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${YELLOW}  [⚠] Detected Python 3.14 (Unstable). Running fix...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo ""
	@bash python313.sh
	@echo -e "${GREEN}  [✔] Fix complete. Run 'make run' to start tools.${RESET}"

# ---- CLEANUP ----
clean:
	@clear
	@echo -e "${CYAN}"
	@echo "  ╔══════════════════════════════════════════════════════════════╗"
	@echo "  ║       🧹  THE RIPPER - CLEANUP UTILITY                   ║"
	@echo "  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${RESET}"
	@echo -e "${YELLOW}  [i] Removing temporary files...${RESET}"
	@rm -f Ripper.enc.py Ripper.bak.py 2>/dev/null || true
	@rm -rf __pycache__ 2>/dev/null || true
	@echo -e "${GREEN}  [✔] Cleanup complete!${RESET}"

# ---- BACKUP ----
backup:
	@clear
	@echo -e "${CYAN}"
	@echo "  ╔══════════════════════════════════════════════════════════════╗"
	@echo "  ║       📦  THE RIPPER - BACKUP UTILITY                     ║"
	@echo "  ╚══════════════════════════════════════════════════════════════╝"
	@echo -e "${RESET}"
	@if [ -f ${TARGET} ]; then \
		echo -e "${YELLOW}  [i] Backing up ${TARGET}...${RESET}"; \
		cp ${TARGET} Ripper.bak.py; \
		echo -e "${GREEN}  [✔] Backup saved as Ripper.bak.py${RESET}"; \
	else \
		echo -e "${RED}  [✘] Error: ${TARGET} not found!${RESET}"; \
	fi

# ---- ALL ----
all: clean backup run