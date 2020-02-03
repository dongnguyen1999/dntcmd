#Say hello user, the first messages
ver=`version`
echo -e "\e[1;32mHello \e[1;34m$USER\e[1;32m! Welcome to \e[1;33mĐNT Commands ver $ver\e[1;32m!";
echo -e "\e[1;32mType \e[1;31m'hi'\e[1;32m to get information about the newest features"
echo -e "\e[1;32mType \e[1;31m'dhelp'\e[1;32m to get help about ĐNT Commands usage"

export PS1="\[\033[01;32m\]$USER@ĐNT-Commands\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
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
#export constances
$DNT_HOME/bash/init/export_values.bash 2>> "/var/dntcmd/error.log"
#set auto update
echo -e "\e[1;32mEnter your password for autoupdate \e[1;31m(Ctr+C to cancel)\e[1;32m"
dntcmd update 2>> "/var/dntcmd/update.log"
echo -e "\e[0m"