#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" GMDoc2
Copyright (c) 2018, Patrik Kraif.
"""
import argparse
import json
import os
import re
import sys
import xml.etree.ElementTree as ET


def escape(string):
    return string.replace("_", "\\_")


class GMBase(object):
    def __init__(self, desc=""):
        self._desc = desc

    def __str__(self):
        return self.desc()

    def desc(self):
        s = self._desc.strip()
        return re.sub(r"\\\s+", "", s)


class GMProject(GMBase):
    def __init__(self, name, version):
        self.name = name
        self.version = version  # 1 or 2
        self.scripts = []

    @staticmethod
    def load(fname):
        """ Loads a project from the GM:S/GMS2 file.
        Args:
            fname (str): Name of the project file.
        Returns:
            GMProject: The loaded GM project.
        """
        if fname.endswith(".project.gmx"):
            version = 1
        elif fname.endswith(".yyp"):
            version = 2
        else:
            raise ValueError("Given file is not a GM:S or GMS2 project file.")

        name = os.path.splitext(os.path.basename(fname))[0]
        print("Loading project {}...".format(name))
        project = GMProject(name, version)

        if project.version == 1:
            tree = ET.parse(fname)
            root = tree.getroot()
            for s in root.find("scripts").findall("script"):
                print("Loading scripts from {}".format(s.text))
                with open(os.path.join(PATH, s.text)) as f:
                    GMScript.load(f, project.scripts)
        else:
            tree = json.load(open(fname))
            for r in tree["resources"]:
                val = r["Value"]
                if val["resourceType"] == "GMScript":
                    spath = val["resourcePath"].replace(".yy", ".gml")
                    print("Loading script {}".format(spath))
                    with open(os.path.join(PATH, spath)) as f:
                        GMScript.load(f, project.scripts)

        project.scripts.sort(key=lambda x: x.name)
        print("... done")
        return project

    def save_doc(self, rfn, tfn):
        """ Saves project documentation into the file using given template.
        Args:
            rfn (str): The file to save the documentation into.
            tfn (str): The template file.
        """
        print("Saving project {} to {} using template {}...".format(
            self.name, rfn, tfn))

        with open(tfn, "r") as tf:
            fstr = tf.read()

            reference_toc = "\n".join(
                map(lambda x: "\t- " + x.link(), self.scripts))
            reference = "".join(map(lambda x: str(x), self.scripts))

            fstr = fstr.replace("<REFERENCE_TOC>", reference_toc)
            fstr = fstr.replace("<REFERENCE>", reference)

            with open(rfn, "w") as rf:
                rf.write(fstr)

        print("... done")


class GMScript(GMBase):
    def __init__(self, name, arglist, desc=""):
        super(GMScript, self).__init__(desc)
        self.name = name
        self.arglist = arglist
        self.args = []
        self.retval = None
        self.note = None
        self.see_also = []
        self.example = None
        self.source = None

    def __str__(self):
        s = "## {}\n".format(escape(self.name))

        s += "```\n{}{}\n```".format(self.name, self.arglist)

        desc = self.desc()
        if desc:
            s += "\n{}".format(desc)

        if self.args:
            s += "\n\n### Arguments:\n"
            s += "Name | Type | Description\n"
            s += "---- | ---- | -----------\n"
            s += "\n".join(map(str, self.args))

        if self.retval:
            s += "\n\n### Returns:\n"
            s += "{}".format(self.retval)

        if self.note:
            s += "\n\n### Note:\n"
            s += "{}".format(self.note)

        if self.see_also:
            s += "\n\n### See Also:\n"
            s += ", ".join(map(str, self.see_also))

        if self.example:
            s += "\n\n### Example:\n"
            s += "{}".format(self.example)

        if self.source:
            s += "\n\n### Source:\n"
            s += "{}".format(self.source)

        s += "\n" * 2
        return s

    def valid(self):
        return (self.desc() or
                self.args or
                self.retval or
                self.note or
                self.see_also or
                self.example)

    def link(self):
        return "[{}](#{})".format(self.name, self.name.lower())

    @staticmethod
    def load(f, l):
        """ Loads scripts from the given file and stores them into the list. """
        gm_obj_last = None
        script = None

        def _append_script():
            nonlocal script
            nonlocal gm_obj_last
            if script is not None:
                if script.valid():
                    l.append(script)
                gm_obj_last = None
                script = None

        lines = f.readlines()

        for line in lines:
            line = line.strip()

            # Found script name
            m = re.match(r"/// @func\s+(.+)(\(.*\))", line)
            if not m:
                m = re.match(r"/// @function\s+(.+)(\(.*\))", line)
            if m:
                _append_script()
                script = GMScript(m.group(1).strip(),
                                  m.group(2).strip())
                gm_obj_last = script
                continue

            # Found script description
            m = re.match(r"/// @desc(\s+(.+))?", line)
            if not m:
                m = re.match(r"/// @description(\s+(.+))?", line)
            if m and script:
                desc = m.group(2).strip() if m.group(2) else ""
                script._desc = desc
                gm_obj_last = script
                continue

            # Found script argument
            m = re.match(
                r"/// @param(\s*\{(.+)\})?\s+([\w.]+)(\s+(.+))?", line)
            if not m:
                m = re.match(
                    r"/// @arg(\s*\{(.+)\})?\s+([\w.]+)(\s+(.+))?", line)
            if not m:
                m = re.match(
                    r"/// @argument(\s*\{(.+)\})?\s+([\w.]+)(\s+(.+))?", line)
            if m and script:
                typename = m.group(2).strip() if m.group(2) else ""
                name = m.group(3).strip()
                desc = m.group(5).strip() if m.group(5) else ""
                arg = GMArg(name, typename, desc)
                script.args.append(arg)
                gm_obj_last = arg
                continue

            # Found script return value
            m = re.match(r"/// @return(\s+\{(.+)\})?(\s+(.+))?", line)
            if m and script:
                typename = m.group(2).strip() if m.group(2) else ""
                desc = m.group(4).strip() if m.group(4) else ""
                retval = GMRetVal(typename, desc)
                script.retval = retval
                gm_obj_last = retval
                continue

            # Found script note
            m = re.match(r"/// @note(\s+(.+))?", line)
            if m and script:
                desc = m.group(1).strip() if m.group(1) else ""
                note = GMNote(desc)
                script.note = note
                gm_obj_last = note
                continue

            # Found script source
            m = re.match(r"/// @source(\s+(.+))?", line)
            if m and script:
                desc = m.group(1).strip() if m.group(1) else ""
                source = GMSource(desc)
                script.source = source
                gm_obj_last = source
                continue

            # Found script reference
            m = re.match(r"/// @see\s+(\w+)", line)
            if m and script:
                script.see_also.append(GMReference(m.group(1).strip()))
                gm_obj_last = None
                continue

            # Found script usage example
            m = re.match(r"/// @example(\s+(.+))?", line)
            if m and script:
                desc = m.group(2).strip() if m.group(2) else ""
                example = GMExample(desc)
                script.example = example
                gm_obj_last = example
                continue

            # Description continuation
            if line.startswith("///"):
                if not gm_obj_last:
                    continue

                if isinstance(gm_obj_last, GMBase):
                    if not isinstance(gm_obj_last, GMExample):
                        gm_obj_last._desc += " {}".format(line[4:].strip())
                    else:
                        gm_obj_last._desc += "\n{}".format(line[4:])
                    continue

            # End of script description
            _append_script()

        _append_script()


class GMArg(GMBase):
    def __init__(self, name, typename, desc):
        super(GMArg, self).__init__(desc)
        self.name = name
        self.typename = typename

    def __str__(self):
        return "{} | `{}` | {}".format(
            escape(self.name), self.typename, self.desc())


class GMRetVal(GMBase):
    def __init__(self, typename, desc):
        super(GMRetVal, self).__init__(desc)
        self.typename = typename

    def __str__(self):
        if self.typename:
            return "`{}`: {}".format(self.typename, self.desc())
        return self.desc()


class GMNote(GMBase):
    def __init__(self, desc):
        super(GMNote, self).__init__(desc)

    def __str__(self):
        return "{}".format(self.desc())


class GMSource(GMBase):
    def __init__(self, desc):
        super(GMSource, self).__init__(desc)

    def __str__(self):
        return "{}".format(self.desc())


class GMReference(GMBase):
    def __init__(self, desc):
        super(GMReference, self).__init__(desc)

    def __str__(self):
        return "[{}](#{})".format(
            self._desc, self._desc.replace("_", "-_").lower())


class GMExample(GMBase):
    def __init__(self, desc=""):
        super(GMExample, self).__init__(desc)


if __name__ == "__main__":
    PARSER = argparse.ArgumentParser(
        description="Generate GM:S/GMS2 project documentation.")
    PARSER.add_argument("path", metavar="PATH", type=str,
                        help="path to GMS project")

    PARSER.add_argument("--prefix", type=str, default="",
                        help="load only resources that start with given prefix")

    GROUP = PARSER.add_mutually_exclusive_group(required=True)
    # GROUP.add_argument("-i", "--inspect", action="store_true",
    #                    help="inspect project")

    GROUP.add_argument("-g", "--generate", action="store_true",
                       help="generate project documentation")

    ARGS = PARSER.parse_args()
    PATH = os.path.realpath(ARGS.path)

    FNAME = ""
    if not os.path.isfile(PATH):
        if os.path.isdir(PATH):
            print("Project file not specified. Searching...")
            for f in os.listdir(PATH):
                if f.endswith(".project.gmx"):
                    FNAME = os.path.abspath(f)
                    print("Found GM:S project file {}".format(FNAME))
                    break
                if f.endswith(".yyp"):
                    FNAME = os.path.abspath(f)
                    print("Found GMS2 project file {}".format(FNAME))
                    break
        else:
            print("Invalid path.")
            sys.exit(1)
    else:
        FNAME = PATH
        PATH = os.path.dirname(PATH)
        if not FNAME.endswith(".project.gmx") and not FNAME.endswith(".yyp"):
            print("Invalid project file {}".format(FNAME))
            sys.exit(1)

    if not FNAME:
        print("Project file was not found.")
    PROJECT = GMProject.load(FNAME)
    PROJECT.save_doc("README.md", "TEMPLATE.md")
