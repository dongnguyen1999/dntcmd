currentPath="$(dirname $0)"
#init home directory
if [ "$#" -gt 0 ]; then
    $currentPath/init_homedir.bash "$1"
else
    $currentPath/init_homedir.bash
fi

#if .bashrc_dnt is exist, recover before init again
if [ -f "$HOME/.bashrc_dnt" ]; then
    $currentPath/recover_bashrc.bash
fi

#clone ~/.bashrc and append it with init_script
$currentPath/clone_bashrc.bash
cat $currentPath/init_script.bash >> ~/.bashrc

#reset terminal
gnome-terminal
kill -s KILL `ps -o ppid= -p $$`