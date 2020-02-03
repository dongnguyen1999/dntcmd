#!/usr/bin/python3
import sys
import subprocess
import os

parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
onFile = os.path.join(parentPath, "bash/init/on.bash")
offFile = os.path.join(parentPath, "bash/init/off.bash")
getUpdateFiles = os.path.join(parentPath,"bash/update/get_update_files.bash")
copyUpdateFiles = os.path.join(parentPath,"bash/update/copy_update_files.bash")
if len(sys.argv) > 1:
    arg = sys.argv[1]
    if arg.lower() == "on":
        subprocess.call("sudo " + onFile, shell=True)
    elif arg.lower() == "off":
        subprocess.call("sudo " + offFile, shell=True)
    elif arg.lower() == "update":
        subprocess.call("echo \e[1;32m", shell=True)
        subprocess.call("sudo " + getUpdateFiles, shell=True)
        subprocess.call("sudo " + copyUpdateFiles, shell=True)
    else: print("Invalid option!")
