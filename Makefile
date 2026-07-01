# ============================================================
# THE RIPPER - MAKEFILE V4.0 (Auto Force Pull Edition)
# ============================================================

.PHONY: run

# --- 1. RUN WITH FORCE PULL + LOADING KECE ---
run:
	@echo ""
	@echo "  ╔═══════════════════════════════════════════════════════╗"
	@echo "  ║     ☠  THE RIPPER - ULTIMATE LAUNCHER                ║"
	@echo "  ╚═══════════════════════════════════════════════════════╝"
	@echo ""
	@echo "  [✓] Memeriksa koneksi internet..."
	@git fetch --all 2>/dev/null || echo "  [⚠]  Gagal fetch (skip)."
	@echo "  [✓] Menarik update terbaru (Force Pull)..."
	@git reset --hard origin/main 2>/dev/null || echo "  [⚠]  Gagal pull (skip)."
	@echo "  [✓] Sinkronisasi repositori selesai."
	@echo ""
	@echo "  ⏳ Loading The Ripper Engine"
	@echo -n "  🔥"
	@sleep 0.3; echo -n "🔥"
	@sleep 0.3; echo -n "🔥"
	@sleep 0.3; echo -n "🔥"
	@sleep 0.3; echo "🔥"
	@echo ""
	@echo "  ────────────────────────────────────────────────────────"
	@echo "  🗡️  EXECUTING TARGET ACQUISITION..."
	@sleep 1
	@echo "  🚀 LAUNCHING THE RIPPER..."
	@echo ""
	@python3 Ripper.py

# --- 2. CLEAN CACHE DAN FILE SAMPAH ---
clean:
	@echo "  🧹 Membersihkan file sampah..."
	rm -f Ripper.enc.py Ripper.bak.py
	@echo "  [✓] Selesai."

# --- 3. BACKUP FILE SEBELUM UPDATE ---
backup:
	@echo "  📦 Membuat backup Ripper.py..."
	cp Ripper.py Ripper.bak.py
	@echo "  [✓] Backup tersimpan."