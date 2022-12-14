def _decompress(name, src, out, command):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = """ %s $< > $@ """ % command,
    )

def decompress_gzip(name, src, out = ""):
    _decompress(
        name = name,
        src = src,
        out = out if out else src[:-3] if src.endswith(".gz") else None,
        command = "gzip --decompress --force --stdout --quiet",
    )

def decompress_bzip2(name, src, out = ""):
    _decompress(
        name = name,
        src = src,
        out = out if out else src[:-4] if src.endswith(".bz2") else None,
        command = "bzip2 --decompress --force --stdout --quiet",
    )

def decompress_xz(name, src, out = ""):
    _decompress(
        name = name,
        src = src,
        out = out if out else src[:-3] if src.endswith(".xz") else None,
        command = "xz --decompress --force --stdout --quiet",
    )

