#!/usr/bin/python3
import sys
import subprocess
import os

parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
onFile = os.path.join(parentPath, "bash/init/on.bash")
print(parentPath)
if len(sys.argv) > 1:
    arg = sys.argv[1]
    if arg.lower() == "on":s
        subprocess.call(onFile, shell=True)
    elif arg.lower() == "off":
        subprocess.call(offFile, shell=True)
    elif arg.lower() == "update":
        subprocess.call(getUpdateFiles, shell=True)
        subprocess.call(copyUpdateFiles, shell=True)
    else: print("Invalid option!")