#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" Xpanda
Copyright (c) 2018, Patrik Kraif.
"""
import os
import re

# TODO: Handle compatibility (GLSL vs HLSL)
# TODO: Parametrize folder paths
PATH_SHADERS = "./X/shaders/"
PATH_XSHADERS = "./X/Xshaders/"

def clear(file):
    data = ""
    with open(file, "r") as f:
        data = f.read()

        for m in re.finditer(r"#pragma include\(\"(.+)\"\)", data):
            fname = re.escape(m.group(1))
            p = r"#pragma include\(\"" + fname + r"\"\)" + \
                r"[\s\S]*" + \
                r"\/\/ include\(\"" + fname + r"\"\)"
            data = re.sub(p, "#PRAGMA INCLUDE(\"{}\")".format(m.group(1)), data)
            data = data.replace(
                "#pragma include(\"{}\")".format(m.group(1)),
                "#PRAGMA INCLUDE(\"{}\")".format(m.group(1)))

        data = data.replace("#PRAGMA INCLUDE", "#pragma include")
    with open(file, "w") as f:
        f.write(data)

def expand(file):
    data = ""
    includes = []
    level = 0

    def do_expand(file):
        nonlocal data
        nonlocal includes
        nonlocal level
        with open(file, "r") as f:
            lines = f.readlines()
            for l in lines:
                m = re.match(r"#pragma include\(\"(.+)\"\)", l)
                if m:
                    if level == 0:
                        data += l
                    if not m.group(1) in includes:
                        includes.append(m.group(1))
                        level += 1
                        do_expand(PATH_XSHADERS + m.group(1))
                        data += "\n"
                        level -= 1
                        if level == 0:
                            data += "// include(\"{}\")\n".format(m.group(1))
                else:
                    data += l

    do_expand(file)
    with open(file, "w") as f:
        f.write(data)

if __name__ == "__main__":
    for d in os.listdir(PATH_SHADERS):
        for f in os.listdir(PATH_SHADERS + d):
            if f.endswith(".fsh") or f.endswith(".vsh"):
                fpath = PATH_SHADERS + d + "/" + f
                clear(fpath)
                expand(fpath)
