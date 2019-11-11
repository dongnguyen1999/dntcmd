#require init
#!/bin/bash
#if .bashrc_dnt is exist, recover before init again
parentPath="$(dirname $0)"
if [ -f "$HOME/.bashrc_dnt" ]; then
    $parentPath/recover_bashrc.bash
fi

parentPath="$(dirname $0)"
#clone ~/.bashrc and append it with init_script
$parentPath/clone_bashrc.bash
cat $parentPath/init_script.bash >> ~/.bashrc

echo "Turn on DNT Commands successfully! Please start terminal again!"
echo "Press any key..."; read pause
#close terminal
killall -s KILL "bash"
