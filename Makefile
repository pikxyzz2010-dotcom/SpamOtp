# ============================================================
# THE RIPPER - MAKEFILE CINEMATIC V3.0
# ============================================================

.PHONY: run

run:
	@clear
	@echo ""
	@echo "  ╔════════════════════════════════════════════════════════╗"
	@echo "  ║      ☠  T H E   R I P P E R   L A U N C H E R          ║"
	@echo "  ║              [ SYSTEM INITIALIZATION ]                 ║"
	@echo "  ╚════════════════════════════════════════════════════════╝"
	@echo ""
	@echo "  ⚡ Bootstrapping Kernel Modules..."
	@sleep 0.5
	@echo "  ⚡ Loading Encryption Protocols..."
	@sleep 0.5
	@echo ""
	@echo "  ╔════════════════════════════════════════════════════════╗"
	@echo "  ║   [  PULLING UPDATES FROM REPOSITORY  ]                ║"
	@echo "  ╚════════════════════════════════════════════════════════╝"
	@echo -n "  [░░░░░░░░░░] 0%"
	@sleep 0.3; echo -ne "\r  [▓░░░░░░░░░] 10%"
	@sleep 0.3; echo -ne "\r  [▓▓░░░░░░░░] 20%"
	@sleep 0.3; echo -ne "\r  [▓▓▓░░░░░░░] 30%"
	@git fetch origin 2>/dev/null || echo -ne "\r  [▓▓▓▓░░░░░░] 40%"
	@sleep 0.3; echo -ne "\r  [▓▓▓▓▓░░░░░] 50%"
	@git pull origin main 2>/dev/null || echo -ne "\r  [▓▓▓▓▓▓░░░░] 60%"
	@sleep 0.3; echo -ne "\r  [▓▓▓▓▓▓▓░░░] 70%"
	@sleep 0.3; echo -ne "\r  [▓▓▓▓▓▓▓▓░░] 80%"
	@sleep 0.3; echo -ne "\r  [▓▓▓▓▓▓▓▓▓░] 90%"
	@sleep 0.3; echo -ne "\r  [▓▓▓▓▓▓▓▓▓▓] 100%"
	@echo ""
	@echo "  [✓]  SYSTEM 100% SYNCHRONIZED."
	@sleep 0.5
	@echo ""
	@echo "  ╔════════════════════════════════════════════════════════╗"
	@echo "  ║   [  DEPLOYING EXECUTION PROTOCOL  ]                   ║"
	@echo "  ╚════════════════════════════════════════════════════════╝"
	@echo ""
	@echo -n "  T H E   R I P P E R   I S   "
	@sleep 0.4; echo -n "C O M I N G   "
	@sleep 0.4; echo "F O R   Y O U . . ."
	@sleep 1
	@echo ""
	@echo "  ╔════════════════════════════════════════════════════════╗"
	@echo "  ║               🗡️  🩸  🔥  🩸  🗡️                         ║"
	@echo "  ╚════════════════════════════════════════════════════════╝"
	@echo ""
	@sleep 1
	@clear
	@python3 Ripper.py
