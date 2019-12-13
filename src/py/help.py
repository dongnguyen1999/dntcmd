#!/usr/bin/python3
import sys
import subprocess
import os

parentPath = os.path.dirname(__file__)
parentPath = parentPath[0 : parentPath.rfind("/")]
helpDoc = os.path.join(parentPath, "help/help")
cmdHelp = os.path.join(parentPath, "help/cmd")
listOfHelpFiles = os.listdir(cmdHelp)

def havingHelp(cmdNeedHelp):
    for item in listOfHelpFiles:
        if (cmdNeedHelp == str(item)):
            return True
    return False




if len(sys.argv) > 1:
    arg = sys.argv[1]
    if havingHelp(arg):
        fullPath = os.path.join(cmdHelp, arg)
        subprocess.call("cat " + fullPath, shell=True)
    else: print("Invalid option!")
else:
    subprocess.call("cat " + helpDoc, shell=True)
    
