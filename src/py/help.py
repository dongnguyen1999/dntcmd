#!/usr/bin/python3
import sys
import subprocess
import os

parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
helpDoc = os.path.join(parentPath, "help/help")
if len(sys.argv) > 1:
    arg = sys.argv[1]
    if arg.lower() == "on":
        print("on")
    else: print("Invalid option!")
else:
    subprocess.call("cat " + helpDoc, shell=True)
    
