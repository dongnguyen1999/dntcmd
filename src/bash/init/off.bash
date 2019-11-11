#recover and restart terminal
#!/bin/bash
parentPath="$(dirname $0)"
$parentPath/recover_bashrc.bash

echo "Turn off DNT Commands successfully! Please start terminal again!"
echo "Press any key..."; read pause
#close terminal
killall -s KILL "bash"