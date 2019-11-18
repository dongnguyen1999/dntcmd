#Say hello user, the first messages
echo "Hello $USER! Welcome to DNT Commands v0.04!"
echo "Type 'dntcmd update' to install new updates"
echo "Type 'hi' to get information about the newest features"
echo "Type 'dhelp' to get help about DNT Commands usage"

#function to set title
function set-title(){
    if [[ -z "$ORIG" ]]; then
        ORIG="$PS1"
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1="${ORIG}${TITLE}"
}
set-title "DNT Commands" # set title

home_path=/var/dntcmd/DNT_HOME #temp
#export path to dntcmd directory
export DNT_HOME=`cat $home_path` 
cmd_path=$DNT_HOME/cmd #temp
#export link to open repository
export UPDATE_REPO="https://dongnguyen1999:Dong1357432589@github.com/dongnguyen1999/dntcmd.git"
#update path
export PATH=$cmd_path:$PATH
#set auto update
echo "Enter your password for autoupdate"
dntcmd update