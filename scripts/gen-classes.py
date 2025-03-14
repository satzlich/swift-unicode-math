import urllib.request
import os

URL = "https://www.unicode.org/Public/math/revision-15/MathClass-15.txt"
INPUT = "MathClass.txt"
OUTPUT = "Sources/UnicodeMathClass/MathClassData.swift"
CLASSES = {
    "N": "Normal",
    "A": "Alphabetic",
    "B": "Binary",
    "C": "Closing",
    "D": "Diacritic",
    "F": "Fence",
    "G": "GlyphPart",
    "L": "Large",
    "O": "Opening",
    "P": "Punctuation",
    "R": "Relation",
    "S": "Space",
    "U": "Unary",
    "V": "Vary",
    "X": "Special",
}

if not os.path.exists(INPUT):
    urllib.request.urlretrieve(URL, INPUT)

mapping = []

with open(INPUT) as f:
    for line in f:
        line = line.split("#")[0].strip()
        if not line:
            continue

        cp, cl = line.split(";")
        parts = [int(x, 16) for x in cp.split("..")]

        if len(parts) == 1:
            mapping.append((parts[0], cl))
        else:
            for v in range(parts[0], parts[1] + 1):
                mapping.append((v, cl))

mapping.sort()

with open(OUTPUT, "w") as f:
    f.write("// This file is generated by gen-classes.py\n")
    f.write("// Do not edit by hand!\n\n")
    f.write("@usableFromInline\n")
    f.write("let mathClasses: [UnicodeScalar: MathClass] = [\n")
    for cp, cl in mapping:
        f.write(f"    \"\\u{{{cp:05x}}}\": .{CLASSES[cl]},\n")
    f.write("];\n")
