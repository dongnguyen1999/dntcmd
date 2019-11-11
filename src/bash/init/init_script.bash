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
cmd_path=/home/ndong/Documents/Shell-Programming/dntcmd/src/cmd

export DNT_HOME=`cat $home_path`

export PATH=$cmd_path:$PATH