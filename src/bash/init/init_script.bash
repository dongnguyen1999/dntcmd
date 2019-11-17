echo "Hello $USER! Welcome to DNT Commands!"
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
export UPDATE_REPO="git@github.com:dongnguyen1999/dntcmd.git"

export PATH=$cmd_path:$PATH