import time
import os

# Clear screen
os.system('clear')

# Warna merah + blink
red_blink = "\033[1;31m\033[5m"
reset = "\033[0m"

print(f"{red_blink}🔥 THE RIPPER IS WATCHING YOU 🔥{reset}")

# Biarkan selama 5 detik
time.sleep(5)

# Matikan blink
print(f"{reset}")
