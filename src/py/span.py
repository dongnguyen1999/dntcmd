import sys
import subprocess

if len(sys.argv) > 1:
    span = sys.argv[1]
    closeSpan = span
    text = ""
    for avg in sys.argv[2:]:
        text += avg + " "
    text = text.strip()
    if "COLOR" in span:
        closeSpan = "\e[0m"
    text = span + text + closeSpan
    subprocess.call("echo '" + text + "'",shell=True)
