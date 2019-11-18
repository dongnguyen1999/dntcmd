currentPath="$(dirname $0)"
#init home directory
if [ "$#" -gt 0 ]; then
    sudo $currentPath/init_homedir.bash "$1"
else
    sudo $currentPath/init_homedir.bash
fi

#if .bashrc_dnt is exist, recover before init again
if [ -f "$HOME/.bashrc_dnt" ]; then
    sudo $currentPath/recover_bashrc.bash
fi

#clone ~/.bashrc and append it with init_script
sudo $currentPath/clone_bashrc.bash
sudo cat $currentPath/init_script.bash >> ~/.bashrc

#reset terminal
gnome-terminal
kill -s KILL `ps -o ppid= -p $$`