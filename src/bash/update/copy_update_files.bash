#require download update file success
update_path="$DNT_HOME/update"
if [ -d "$update_path/dntcmd" ]; then
    sudo rm -r $DNT_HOME/bash $DNT_HOME/cmd $DNT_HOME/py $DNT_HOME/help 
    cd "$update_path/dntcmd/src"
    sudo cp -r -t $DNT_HOME `ls`
    sudo rm -r "$update_path/dntcmd"
fi
