SHELL = /bin/bash
PYTHON = python3
TARGET = Ripper.py

RED   = \033[1;31m
GREEN = \033[1;32m
YELLOW= \033[1;33m
BLUE  = \033[1;34m
CYAN  = \033[1;36m
WHITE = \033[1;37m
RESET = \033[0m

.PHONY: run clean backup all

run:
	@clear
	@echo -e "${RED}"
	@echo "     ████████╗██╗  ██╗███████╗    ██████╗ ██╗██████╗ ██████╗ ███████╗██████╗ "
	@echo "     ╚══██╔══╝██║  ██║██╔════╝    ██╔══██╗██║██╔══██╗██╔══██╗██╔════╝██╔══██╗"
	@echo "        ██║   ███████║█████╗      ██████╔╝██║██████╔╝██████╔╝█████╗  ██████╔╝"
	@echo "        ██║   ██╔══██║██╔══╝      ██╔══██╗██║██╔═══╝ ██╔══██╗██╔══╝  ██╔══██╗"
	@echo "        ██║   ██║  ██║███████╗    ██║  ██║██║██║     ██║  ██║███████╗██║  ██║"
	@echo "        ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
	@echo -e "${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════${RESET}"
	@echo -e "${GREEN}  [✔] LAUNCHER V5.3 — ULTIMATE STABLE${RESET}"
	@echo -e "${YELLOW}  [i] Target: ${TARGET}${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════${RESET}"
	@echo ""

	@echo -e "${BLUE}  [⏳] Checking Internet Connection...${RESET}"
	@ping -c 1 8.8.8.8 > /dev/null 2>&1 || { echo -e "${RED}  [✘] No internet! Skipping git pull.${RESET}"; sleep 1; }

	@echo -e "${BLUE}  [⏳] Syncing with GitHub (Force Pull)...${RESET}"
	@git fetch --all 2>/dev/null || true
	@git reset --hard origin/main 2>/dev/null || echo -e "${YELLOW}  [⚠]  Not a git repo or no remote. Skipping.${RESET}"
	@echo -e "${GREEN}  [✔] Repository synchronized!${RESET}"
	@echo ""

	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════${RESET}"
	@echo -e "${YELLOW}  [🔥] LOADING THE RIPPER ENGINE...${RESET}"
	@echo -e "${CYAN}  ┌──────────────────────────────────────────────────────┐${RESET}"
	@echo -e "${CYAN}  │${RESET} ${RED}▓▓▓▓▓▓▓▓▓▓${RESET} ${GREEN}100%${RESET}"
	@echo -e "${CYAN}  └──────────────────────────────────────────────────────┘${RESET}"
	@sleep 1
	@echo -e "${GREEN}  [✔] Engine Loaded.${RESET}"
	@echo ""

	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════${RESET}"
	@echo -e "${RED}  ⚡ EXECUTING ${TARGET}...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════${RESET}"
	@echo ""
	@${PYTHON} ${TARGET}

clean:
	@clear
	@echo -e "${CYAN}"
	@echo "  ╔═══════════════════════════════════════════════════════════╗"
	@echo "  ║       🧹  THE RIPPER - CLEANUP UTILITY                   ║"
	@echo "  ╚═══════════════════════════════════════════════════════════╝"
	@echo -e "${RESET}"
	@echo -e "${YELLOW}  [i] Removing temporary files...${RESET}"
	@rm -f Ripper.enc.py Ripper.bak.py 2>/dev/null || true
	@rm -rf __pycache__ 2>/dev/null || true
	@echo -e "${GREEN}  [✔] Cleanup complete!${RESET}"

backup:
	@clear
	@echo -e "${CYAN}"
	@echo "  ╔═══════════════════════════════════════════════════════════╗"
	@echo "  ║       📦  THE RIPPER - BACKUP UTILITY                    ║"
	@echo "  ╚═══════════════════════════════════════════════════════════╝"
	@echo -e "${RESET}"
	@if [ -f ${TARGET} ]; then \
		echo -e "${YELLOW}  [i] Backing up ${TARGET}...${RESET}"; \
		cp ${TARGET} Ripper.bak.py; \
		echo -e "${GREEN}  [✔] Backup saved as Ripper.bak.py${RESET}"; \
	else \
		echo -e "${RED}  [✘] Error: ${TARGET} not found!${RESET}"; \
	fi

all: clean backup run
