import subprocess
import sys
import os
import threading
import time
import importlib.util

# ---- WARNA ----
a = "\033[1;30m"
m = "\033[1;31m"
h = "\033[1;32m"
k = "\033[1;33m"
c = "\033[1;36m"
p = "\033[1;37m"
r = "\033[0m"

# ---- DAFTAR PAKET ----
PKG_PACKAGES = [
    "python",
    "clang",
    "make",
    "git",
    "wget",
    "libjpeg-turbo",
    "termux-api",
]

PIP_PACKAGES = [
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
def run(cmd, cwd=None):
    return subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd=cwd
    )

def pkg_installed(package):
    r = run(["dpkg", "-s", package])
    return r.returncode == 0 and "Status: install ok installed" in r.stdout

def pip_installed(import_name):
    return subprocess.run(
        [sys.executable, "-c", f"import {import_name}"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    ).returncode == 0

def overwrite(text, newline=False):
    end = "\n" if newline else ""
    sys.stdout.write(f"\r\033[K{text}{end}")
    sys.stdout.flush()

def animate(label, stop_event):
    dots = ["     ", ".    ", "..   ", "...  ", ".... ", "....."]
    i = 0
    while not stop_event.is_set():
        overwrite(f"  {p}[{h}>{p}] {label}{m}{dots[i % len(dots)]}")
        i += 1
        time.sleep(0.1)

def with_animation(label, task):
    stop = threading.Event()
    t = threading.Thread(target=animate, args=(label, stop), daemon=True)
    t.start()
    try:
        result = task()
    finally:
        stop.set()
        t.join()
    return result

# ---- HANDLER ----
def handle_pkg(package):
    installed = with_animation(f"Mengecek Package {package}", lambda: pkg_installed(package))
    if installed:
        overwrite(f"  {p}[{h}>{p}] Package {package} Terdeteksi", newline=True)
        return

    success = with_animation(
        f"Mendownload Package {package}",
        lambda: (
            subprocess.run(["pkg", "install", "-y", package], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL),
            pkg_installed(package)
        )[1]
    )

    if success:
        overwrite(f"  {p}[{h}>{p}] Package {package} Terinstal", newline=True)
    else:
        overwrite(f"  {p}[{m}>{p}] Package {package} Gagal Diinstall!", newline=True)
        sys.exit(1)

def handle_pip(display, import_name):
    installed = with_animation(f"Mengecek Package {display}", lambda: pip_installed(import_name))
    if installed:
        overwrite(f"  {p}[{h}>{p}] Package {display} Terdeteksi", newline=True)
        return

    pkg_name = "pillow<11" if display.lower() == "pillow" else display
    success = with_animation(
        f"Mendownload Package {display}",
        lambda: (
            subprocess.run(
                [sys.executable, "-m", "pip", "install", "--quiet", "--break-system-packages", pkg_name],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            ),
            pip_installed(import_name)
        )[1]
    )

    if success:
        overwrite(f"  {p}[{h}>{p}] Package {display} Terinstal", newline=True)
    else:
        overwrite(f"  {p}[{m}>{p}] Package {display} Gagal Diinstall!", newline=True)
        sys.exit(1)

# ---- FIX PYTHON 3.14 ----
def fix_python_version():
    if sys.version_info >= (3, 14):
        overwrite(f"  {p}[{m}>{p}] Python 3.14 Terdeteksi! Menjalankan Fix...", newline=True)
        subprocess.run(["bash", "python313.sh"])
        overwrite(f"  {p}[{h}>{p}] Python Berhasil Diperbaiki!", newline=True)

# ---- GIT UPDATE ----
def check_update(script_dir):
    result = with_animation("Memeriksa Pembaruan", lambda: run(["git", "pull"], cwd=script_dir))
    if result.returncode != 0:
        overwrite(f"  {p}[{m}>{p}] Gagal Memeriksa Pembaruan!", newline=True)
        return
    output = result.stdout.lower() + result.stderr.lower()
    if "already up to date" in output:
        overwrite(f"  {p}[{h}>{p}] Tidak Ada Pembaruan", newline=True)
    else:
        overwrite(f"  {p}[{h}>{p}] Pembaruan Berhasil", newline=True)

# ---- BANNER ----
def banner():
    os.system("clear")
    print(f"""{a}
╔═══════════════════════════════════════════════════════════╗
║{p}  THE RIPPER - LAUNCHER V5.3 ULTIMATE                   {a}║
║{p}  Auto Installer + Auto Fix Python 3.14                 {a}║
║{p}  Wait a minute, don't spam button!                     {a}║
╚═══════════════════════════════════════════════════════════╝
""")

# ---- MAIN ----
def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    banner()

    # 1. Fix Python 3.14
    fix_python_version()

    # 2. Install Termux Packages
    for pkg in PKG_PACKAGES:
        handle_pkg(pkg)

    # 3. Install PIP Packages
    for display, imp in PIP_PACKAGES:
        handle_pip(display, imp)

    # 4. Git update
    check_update(script_dir)

    # 5. Jalankan Ripper.py atau loader.pyc
    targets = ["Ripper.py", "loader.pyc"]
    target = None
    for t in targets:
        path = os.path.join(script_dir, t)
        if os.path.exists(path):
            target = path
            break

    if not target:
        print(f"{p}  [{m}>{p}] Tidak ada file Ripper.py atau loader.pyc!")
        sys.exit(1)

    print(f"{p}  [{h}>{p}] Menjalankan: {os.path.basename(target)}")
    os.execv(sys.executable, [sys.executable, target])

if __name__ == "__main__":
    main()
