#!/usr/bin/python3
import sys
import subprocess
import os

default_homedir="~/DNT_Commands"
parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
initHomeDir = os.path.join(parentPath, "bash/init/init.bash")
initHomeDir += "  " + default_homedir
subprocess.call(initHomeDir, shell=True)
cpCmd = "sudo cp -r -t " + default_homedir + " " + os.path.join(parentPath, "cmd") + " " + os.path.join(parentPath, "bash") + " " + os.path.join(parentPath, "py") + " " + os.path.join(parentPath, "dntcmd")
subprocess.call(cpCmd, shell=True)
