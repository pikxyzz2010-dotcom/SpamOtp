# run.py
import marshal

with open("loader.pyc", "rb") as f:
    f.read(12)  # Skip magic + timestamp + size
    code = marshal.load(f)

exec(code)
