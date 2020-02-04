#!/usr/bin/python3
import sys
import subprocess
import os

parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
skypePath = os.path.join(parentPath, "bash/install/skype.bash")
vscPath = os.path.join(parentPath, "bash/install/vsc.bash")
javaPath = os.path.join(parentPath, "bash/install/java.bash")

if len(sys.argv) > 1:
    arg = sys.argv[1]
    if arg.lower() == "skype":
        subprocess.call("sudo " + skypePath, shell=True)
    elif arg.lower() == "vsc":
        subprocess.call("sudo " + vscPath, shell=True)
    elif arg.lower() == "java":
        subprocess.call("sudo " + javaPath, shell=True)
    else:
        subprocess.call("sudo apt install -y " + arg, shell=True)

