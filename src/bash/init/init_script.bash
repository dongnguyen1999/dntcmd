echo "Hello $USER! Welcome to DNT Commands!"
echo "Type 'dntcmd update' to install new updates"
echo "Type 'hi' to get information about the newest features"
echo "Type 'dhelp' to get help about DNT Commands usage"

function set-title(){
    if [[ -z "$ORIG" ]]; then
        ORIG="$PS1"
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1="${ORIG}${TITLE}"
}
set-title "DNT Commands"

home_path=/var/dntcmd/DNT_HOME
export DNT_HOME=`cat $home_path`
cmd_path=$DNT_HOME/cmd
export UPDATE_REPO="https://dongnguyen1999:Dong1357432589@github.com/dongnguyen1999/dntcmd.git"

export PATH=$cmd_path:$PATH