#Say hello user, the first messages
echo "Hello $USER! Welcome to ĐNT Commands ver 0.11!"
echo "Type 'hi' to get information about the newest features"
echo "Type 'dhelp' to get help about ĐNT Commands usage"

export PS1="\[\e[32m\]$USER@DNT-Commands:\w$\[\e[m\]"
#function to set title
function set-title(){
    if [[ -z "$ORIG" ]]; then
        ORIG="$PS1"
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1="${ORIG}${TITLE}"
}
set-title "ĐNT Commands" # set title
home_path=/var/dntcmd/DNT_HOME #temp
#export path to dntcmd directory
export DNT_HOME=`cat $home_path` 
cmd_path=$DNT_HOME/cmd #temp
#export link to open repository
export UPDATE_REPO="https://dongnguyen1999:Dong1357432589@github.com/dongnguyen1999/dntcmd.git"
#update path
export PATH=$cmd_path:$PATH
#set auto update
echo "Enter your password for autoupdate (Ctr+C to cancel)"
dntcmd update 2>> "/var/dntcmd/update.log"