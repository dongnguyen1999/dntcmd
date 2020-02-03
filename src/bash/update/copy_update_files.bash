#require download update file success
DNT_HOME=`cat /var/dntcmd/DNT_HOME` 
update_path="$DNT_HOME/update"
if [ -d "$update_path/dntcmd" ]; then
    sudo rm -r $DNT_HOME/bash $DNT_HOME/cmd $DNT_HOME/py $DNT_HOME/help $DNT_HOME/cpp 
    cd "$update_path/dntcmd/src"
    sudo cp -r -t $DNT_HOME `ls`
    sudo rm -r "$update_path/dntcmd"
    #require init
    #if .bashrc_dnt is exist, recover before init again
    parentPath="$(dirname $(dirname $0))"
    if [ -f "$HOME/.bashrc_dnt" ]; then
        $parentPath/init/recover_bashrc.bash 2>> "/var/dntcmd/copyupdate.log" 
    fi
    #update .bashrc
    parentPath="$(dirname $(dirname $0))"
    #clone ~/.bashrc and append it with init_script
    $parentPath/init/clone_bashrc.bash 2>> "/var/dntcmd/copyupdate.log"
    cat $parentPath/init/init_script.bash >> ~/.bashrc
    echo "\e[1;32mEverything is up to date\e[0m"
else 
    echo "\e[1;31mSomething wrong! Check your internet connection!\e[0m"
fi
