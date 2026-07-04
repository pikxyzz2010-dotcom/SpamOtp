import subprocess
import sys
import os
import threading
import time
import importlib.util

# ---- WARNA PREMIUM ----
B = "\033[1;30m"   # Black
R = "\033[1;31m"   # Red
G = "\033[1;32m"   # Green
Y = "\033[1;33m"   # Yellow
C = "\033[1;36m"   # Cyan
W = "\033[1;37m"   # White
N = "\033[0m"      # Reset

# ---- DAFTAR PAKET ----
TERMUX_PKGS = [
    "python", "clang", "make", "git", "wget",
    "libjpeg-turbo", "termux-api",
]

PIP_PKGS = [
    ("requests", "requests"),
    ("beautifulsoup4", "bs4"),
    ("urllib3", "urllib3"),
    ("rich", "rich"),
    ("phonenumbers", "phonenumbers"),
    ("pillow", "PIL"),
    ("pycryptodome", "Crypto"),
    ("colorama", "colorama"),
]

# ---- UTILITIES ----
def exec_cmd(cmd, cwd=None):
    return subprocess.run(cmd, capture_output=True, text=True, cwd=cwd)

def is_pkg_installed(pkg):
    r = exec_cmd(["dpkg", "-s", pkg])
    return r.returncode == 0 and "Status: install ok installed" in r.stdout

def is_pip_installed(mod_name):
    return subprocess.run(
        [sys.executable, "-c", f"import {mod_name}"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    ).returncode == 0

def print_status(label, status, color=G):
    icon = f"{color}[ ✔ ]{N}" if status else f"{R}[ ✘ ]{N}"
    print(f"  {icon} {label}")

# ---- ANIMASI (BAR PROGRESS) ----
def loading_animation(label, stop_event):
    bar_len = 30
    i = 0
    while not stop_event.is_set():
        filled = int((i % (bar_len + 1)) / bar_len * bar_len)
        bar = f"{G}{'█' * filled}{N}{'░' * (bar_len - filled)}"
        sys.stdout.write(f"\r  {C}[ • ]{N} {label} [{bar}] {C}{i % 100}%{N}")
        sys.stdout.flush()
        i += 1
        time.sleep(0.05)

def run_with_animation(label, task):
    stop = threading.Event()
    t = threading.Thread(target=loading_animation, args=(label, stop), daemon=True)
    t.start()
    try:
        result = task()
    finally:
        stop.set()
        t.join()
        sys.stdout.write("\n")
    return result

# ---- HANDLER PAKET ----
def install_termux_pkg(pkg):
    installed = run_with_animation(f"Check {pkg}", lambda: is_pkg_installed(pkg))
    if installed:
        print_status(f"Package {pkg} terdeteksi", True)
        return

    success = run_with_animation(
        f"Installing {pkg}",
        lambda: (
            subprocess.run(["pkg", "install", "-y", pkg], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL),
            is_pkg_installed(pkg)
        )[1]
    )
    print_status(f"Package {pkg} terinstall", success)

def install_pip_pkg(display_name, mod_name):
    installed = run_with_animation(f"Check {display_name}", lambda: is_pip_installed(mod_name))
    if installed:
        print_status(f"Module {display_name} terdeteksi", True)
        return

    pkg_name = "pillow<11" if display_name.lower() == "pillow" else display_name
    success = run_with_animation(
        f"Installing {display_name}",
        lambda: (
            subprocess.run(
                [sys.executable, "-m", "pip", "install", "--quiet", "--break-system-packages", pkg_name],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            ),
            is_pip_installed(mod_name)
        )[1]
    )
    print_status(f"Module {display_name} terinstall", success)

# ---- FIX PYTHON ----
def fix_python_314():
    if sys.version_info >= (3, 14):
        print(f"\n  {R}[ ! ]{N} Python 3.14 terdeteksi! Running emergency fix...\n")
        subprocess.run(["bash", "python313.sh"])
        print(f"  {G}[ ✔ ]{N} Python fix complete.\n")

# ---- GIT UPDATE ----
def pull_repo():
    result = run_with_animation("Sync repository", lambda: exec_cmd(["git", "pull"]))
    out = (result.stdout + result.stderr).lower()
    if "already up to date" in out:
        print_status("Repository sudah terbaru", True)
    else:
        print_status("Repository berhasil di-update", True)

# ---- BANNER PREMIUM V2 (COMPACT & RAPI) ----
def show_banner():
    os.system("clear")
    print(f"""{C}
 ╔══════════════════════════════════════════╗
 ║  {G}████████╗██╗  ██╗███████╗    {C}██████╗ ██╗██████╗ {W}║
 ║  {G}╚══██╔══╝██║  ██║██╔════╝    {C}██╔══██╗██║██╔══██╗{W}║
 ║     {G}██║   ███████║█████╗      {C}██████╔╝██║██████╔╝{W}║
 ║     {G}██║   ██╔══██║██╔══╝      {C}██╔══██╗██║██╔═══╝ {W}║
 ║     {G}██║   ██║  ██║███████╗    {C}██║  ██║██║██║     {W}║
 ║     {G}╚═╝   ╚═╝  ╚═╝╚══════╝    {C}╚═╝  ╚═╝╚═╝╚═╝     {W}║
 ║                                              ║
 ║  {Y}[ LAUNCHER V6.0 ]{W}   {C}[ BLACK EDITION ]{W}   ║
 ╚══════════════════════════════════════════════╝
{N}""")

# ---- MAIN ----
def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    show_banner()

    fix_python_314()

    print(f"\n  {Y}[ • ]{N} Verifikasi Paket Sistem:\n")
    for p in TERMUX_PKGS:
        install_termux_pkg(p)

    print(f"\n  {Y}[ • ]{N} Verifikasi Modul Python:\n")
    for d, m in PIP_PKGS:
        install_pip_pkg(d, m)

    print(f"\n  {Y}[ • ]{N} Sinkronisasi Repository:")
    pull_repo()

    # Cari file target
    targets = ["Ripper.py", "loader.pyc"]
    target_file = None
    for t in targets:
        path = os.path.join(script_dir, t)
        if os.path.exists(path):
            target_file = path
            break

    if not target_file:
        print(f"\n  {R}[ ✘ ]{N} Tidak menemukan Ripper.py atau loader.pyc!")
        sys.exit(1)

    print(f"\n  {G}[ ✔ ]{N} Meluncurkan {os.path.basename(target_file)}...\n")
    os.execv(sys.executable, [sys.executable, target_file])

if __name__ == "__main__":
    main()
