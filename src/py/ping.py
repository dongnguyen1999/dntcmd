import sys
import subprocess
 
DEFAULT_IP = "8.8.8.8"
DEFAULT_HOSTNAME = "Google"
if len(sys.argv) > 1:
    arg1 = sys.argv[1]
    if (arg1.lower() == "dong"
        or arg1.lower() == "ndong"
        or arg1.lower() == "anh"
        or arg1.lower() == "a"
        or arg1.lower() == "adev"
        ):
        print("Ping to Đông (25.87.231.159)")
        subprocess.call("ping 25.87.231.159", shell=True)
    elif (arg1.lower() == "thu"
        or arg1.lower() == "mthu"
        or arg1.lower() == "em"
        or arg1.lower() == "e"
        or arg1.lower() == "minhthu"
        ):
        print("Ping to Thư (25.77.159.103)")
        subprocess.call("ping 25.77.159.103", shell=True)
    else:
        print("Ping to " + arg1)
        subprocess.call("ping " + arg1, shell=True)
else: 
    print("Ping to default ip: " + DEFAULT_HOSTNAME + " (" + DEFAULT_IP + ")")
    subprocess.call("ping 8.8.8.8", shell=True)