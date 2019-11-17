#require download update file success
update_path="$DNT_HOME/update"
if [ -d "$update_path/dntcmd" ]; then
    cd "$update_path/dntcmd/src"
    sudo cp -r -t $DNT_HOME `ls`
fi
