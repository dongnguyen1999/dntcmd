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
cpCmd = "cd " + parentPath + " && sudo cp -r -t " + default_homedir + " `ls`"
subprocess.call(cpCmd, shell=True)
