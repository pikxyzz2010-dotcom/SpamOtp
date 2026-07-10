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
    try:
        import requests, urllib3, phonenumbers, pyshorteners, pyqrcode, png, faker
    except ImportError:
        print(f"{YELLOW}[!] Installing required packages...{RESET}")
        os.system("pip install requests urllib3 phonenumbers pyshorteners pyqrcode png faker")

def run_inferno():
    auto_install()
    print(f"{CYAN}[+] Launching INFERNO-X...{RESET}")
    if os.path.exists("INFERNO.pyc"):
        os.system("python INFERNO.pyc")
    else:
        print(f"{RED}[!] File 'INFERNO.pyc' tidak ditemukan!{RESET}")
        sys.exit(1)

def main():
    os.system("clear")
    print(f"{CYAN}")
    print(f"  ╔══════════════════════════════════════════════════════════════╗")
    print(f"  ║      ⚡  I N F E R N O - X   P R E M I U M   L A U N C H E R  ⚡  ║")
    print(f"  ╚══════════════════════════════════════════════════════════════╝")
    print(f"{RESET}")
    run_inferno()

if __name__ == "__main__":
    main()
