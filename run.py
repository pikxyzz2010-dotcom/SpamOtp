#!/usr/bin/env python3
import os
import sys
import subprocess

# Warna
RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"
CYAN = "\033[1;36m"
WHITE = "\033[1;37m"
RESET = "\033[0m"

def auto_install():
    required_modules = [
        "requests", "urllib3", "phonenumbers", 
        "pyshorteners", "pyqrcode", "pypng", 
        "faker", "pycryptodome"
    ]
    
    missing = []
    for mod in required_modules:
        try:
            __import__(mod)
        except ImportError:
            missing.append(mod)
    
    if missing:
        print(f"{YELLOW}[!] Installing missing modules: {', '.join(missing)}{RESET}")
        os.system(f"pip install {' '.join(missing)}")
        print(f"{GREEN}[✔] All modules installed successfully!{RESET}")
    else:
        print(f"{GREEN}[✔] All modules are already installed.{RESET}")

def run_inferno():
    auto_install()
    print(f"{CYAN}[+] Launching INFERNO-X...{RESET}")
    
    # Cek file utama
    if os.path.exists("INFERNO.pyc"):
        os.system("python INFERNO.pyc")
    elif os.path.exists("INFERNO.py"):
        os.system("python INFERNO.py")
    elif os.path.exists("INFERNO.bin"):
        os.system("python INFERNO.bin")
    else:
        print(f"{RED}[!] File utama INFERNO (pyc/py/bin) tidak ditemukan!{RESET}")
        sys.exit(1)

def main():
    os.system("clear")
    print(f"{CYAN}")
    print(f"  ╔══════════════════════════════════════════════════════════════╗")
    print(f"  ║ ⚡  I N F E R N O - X   P R E M I U M   L A U N C H E R  ⚡  ║")
    print(f"  ╚══════════════════════════════════════════════════════════════╝")
    print(f"{RESET}")
    run_inferno()

if __name__ == "__main__":
    main()
