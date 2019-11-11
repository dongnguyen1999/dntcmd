#!/usr/bin/python3
import sys
import subprocess
import os

parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
onFile = os.path.join(parentPath, "bash/init/on.dnt")
offFile = os.path.join(parentPath, "bash/init/off.dnt")
if len(sys.argv) > 1:
    arg = sys.argv[1]
    if arg.lower() == "on":
        subprocess.call(onFile, shell=True)
    elif arg.lower() == "off":
        subprocess.call(offFile, shell=True)
    else: print("Invalid option!")