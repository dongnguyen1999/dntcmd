import sys
import subprocess

if len(sys.argv) > 1:
    arg1 = sys.argv[1]
    if (arg1.lower() == "dong"
        or arg1.lower() == "ndong"
        or arg1.lower() == "anh"
        or arg1.lower() == "a"
        or arg1.lower() == "adev"
        ):
        print("25.77.168.129")
    elif (arg1.lower() == "thu"
        or arg1.lower() == "mthu"
        or arg1.lower() == "em"
        or arg1.lower() == "e"
        or arg1.lower() == "minhthu"
        ):
        print("25.77.159.103")
else: subprocess.call("ifconfig", shell=True)