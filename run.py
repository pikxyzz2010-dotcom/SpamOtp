#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import subprocess

# Warna Terminal
RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"
CYAN = "\033[1;36m"
WHITE = "\033[1;37m"
RESET = "\033[0m"

def cek_python():
    print(f"{CYAN}[+] Checking Python version...{RESET}")
    try:
        version = sys.version_info
        if version.major == 3 and version.minor == 14:
            print(f"{YELLOW}[!] Detected Python 3.14 (Unstable). Running fix...{RESET}")
            return "fix"
        elif version.major < 3 or (version.major == 3 and version.minor < 8):
            print(f"{RED}[!] Python 3.8+ required!{RESET}")
            return "error"
        print(f"{GREEN}[✔] Python {version.major}.{version.minor}.{version.micro} detected.{RESET}")
        return "ok"
    except:
        return "error"

def run_fix():
    print(f"{YELLOW}[i] Switching to Python 3.13 using python313.sh...{RESET}")
    if os.path.exists("python313.sh"):
        subprocess.run(["bash", "python313.sh"])
        # Setelah fix, jalanin ulang run.py dengan python3.13
        subprocess.run(["python3.13", "run.py"])
        sys.exit(0)
    else:
        print(f"{RED}[!] File 'python313.sh' tidak ditemukan!{RESET}")
        print(f"{YELLOW}    Pastikan file python313.sh ada di folder ini.{RESET}")
        sys.exit(1)

def run_inferno():
    print(f"{CYAN}[+] Launching INFERNO-X...{RESET}")
    if not os.path.exists("INFERNO.bin"):
        print(f"{RED}[!] File 'INFERNO.bin' tidak ditemukan!{RESET}")
        print(f"{YELLOW}    Pastikan file 'INFERNO.bin' ada di folder ini.{RESET}")
        return False
    
    try:
        # PAKAI CARA MANUAL (LANGSUNG EKSEKUSI ./INFERNO.bin)
        subprocess.run(["./INFERNO.bin"])
        return True
    except Exception as e:
        print(f"{RED}[!] Gagal menjalankan INFERNO.bin: {e}{RESET}")
        return False

def main():
    os.system("clear")
    print(f"{CYAN}")
    print(f"  ╔══════════════════════════════════════════════════════════════╗")
    print(f"  ║      🔥  I N F E R N O - X   L A U N C H E R  🔥             ║")
    print(f"  ╚══════════════════════════════════════════════════════════════╝")
    print(f"{RESET}")

    status = cek_python()
    
    if status == "fix":
        run_fix()
    elif status == "error":
        sys.exit(1)
    else:
        run_inferno()

if __name__ == "__main__":
    main()
