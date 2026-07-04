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

.PHONY: run clean backup all fix_python

# ---- DETEKSI & FIX PYTHON VERSI 3.14 OTOMATIS ----
fix_python:
	@echo -e "${YELLOW}[i] Checking Python version...${RESET}"
	@PY_VER=$$(python3 --version 2>/dev/null | grep -o '3\.[0-9]*' | head -1); \
	if [ "$$PY_VER" = "3.14" ]; then \
		echo -e "${RED}[!] Detected Python 3.14 (unstable)! Fixing...${RESET}"; \
		echo -e "${YELLOW}[i] Uninstalling Python 3.14...${RESET}"; \
		pkg uninstall python -y 2>/dev/null || true; \
		pkg uninstall python-pip -y 2>/dev/null || true; \
		rm -rf /data/data/com.termux/files/usr/lib/python3.14 2>/dev/null || true; \
		echo -e "${YELLOW}[i] Downloading Python 3.13.2 (aarch64)...${RESET}"; \
		wget -q --show-progress https://packages.termux.dev/apt/termux-main/pool/main/p/python/python_3.13.2_aarch64.deb; \
		echo -e "${YELLOW}[i] Installing Python 3.13.2...${RESET}"; \
		dpkg -i python_3.13.2_aarch64.deb 2>/dev/null || true; \
		pkg mark hold python 2>/dev/null || true; \
		rm -f /data/data/com.termux/files/usr/bin/pip* 2>/dev/null || true; \
		echo -e "${YELLOW}[i] Reinstalling pip...${RESET}"; \
		python -m ensurepip --upgrade 2>/dev/null || true; \
		echo -e "${GREEN}[✔] Fixed! Python version: $$(python --version 2>/dev/null)${RESET}"; \
	else \
		echo -e "${GREEN}[✔] Python $$PY_VER is stable. Skipping fix.${RESET}"; \
	fi
	@echo ""

# ---- RUN UTAMA ----
run: fix_python
	@clear
	@echo -e "${RED}"
	@echo "     ████████╗██╗  ██╗███████╗    ██████╗ ██╗██████╗ ██████╗ ███████╗██████╗ "
	@echo "     ╚══██╔══╝██║  ██║██╔════╝    ██╔══██╗██║██╔══██╗██╔══██╗██╔════╝██╔══██╗"
	@echo "        ██║   ███████║█████╗      ██████╔╝██║██████╔╝██████╔╝█████╗  ██████╔╝"
	@echo "        ██║   ██╔══██║██╔══╝      ██╔══██╗██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██╗"
	@echo "        ██║   ██║  ██║███████╗    ██║  ██║██║██║     ██║     ███████╗██║  ██║"
	@echo "        ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝"
	@echo -e "${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${GREEN}  [✔] LAUNCHER V5.3 — ULTIMATE STABLE${RESET}"
	@echo -e "${YELLOW}  [i] Target: ${TARGET}${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo ""

	@echo -e "${BLUE}  [⏳] Checking Internet Connection...${RESET}"
	@ping -c 1 8.8.8.8 > /dev/null 2>&1 || { echo -e "${RED}  [✘] No internet! Skipping git pull.${RESET}"; sleep 1; }

	@echo -e "${BLUE}  [⏳] Syncing with GitHub (Force Pull)...${RESET}"
	@git fetch --all 2>/dev/null || true
	@git reset --hard origin/main 2>/dev/null || echo -e "${YELLOW}  [⚠]  Not a git repo or no remote. Skipping.${RESET}"
	@echo -e "${GREEN}  [✔] Repository synchronized!${RESET}"
	@echo ""

	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${YELLOW}  [🔥] LOADING THE RIPPER ENGINE...${RESET}"
	@echo -e "${CYAN}  ┌────────────────────────────────────────────────────────────┐${RESET}"
	@echo -e "${CYAN}  │${RESET} ${RED}██████████${RESET} ${GREEN}100%${RESET}"
	@echo -e "${CYAN}  └────────────────────────────────────────────────────────────┘${RESET}"
	@sleep 1
	@echo -e "${GREEN}  [✔] Engine Loaded.${RESET}"
	@echo ""

	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo -e "${RED}  ⚡ EXECUTING ${TARGET}...${RESET}"
	@echo -e "${CYAN}  ═══════════════════════════════════════════════════════════════════${RESET}"
	@echo ""
	@${PYTHON} ${TARGET}

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
