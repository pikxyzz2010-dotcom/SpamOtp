#!/bin/bash
# THE RIPPER - AUTO INSTALLER FOR TERMUX

echo "[+] Mengupdate repositori..."
pkg update && pkg upgrade -y

echo "[+] Menginstall package sistem..."
pkg install -y git python nano curl wget

echo "[+] Menginstall module Python..."
pip install -r requirements.txt

echo "[✓] Selesai! Sekarang jalanin: python3 Ripper.py"