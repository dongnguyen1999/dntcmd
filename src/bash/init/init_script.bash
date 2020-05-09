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
#Say hello user, the first messages
ver=`version`
span GREEN BOLD Hello span BLUE BOLD $USER! span GREEN BOLD Welcome to span YELLOW BOLD ĐNT Commands v$ver
span GREEN BOLD Type span RED BOLD 'hi' span GREEN BOLD to get information about the newest features
span GREEN BOLD Type span RED BOLD 'dhelp' span GREEN BOLD to get help about ĐNT Commands usage
#set auto update
span GREEN BOLD Enter your password for autoupdate span RED BOLD '(Ctr+C to cancel)'
echo -en "\e[1;32m"
#set autostart haguichi service
$DNT_HOME/service/haguichi.service restart
$DNT_HOME/service/haguichi.service start
#set autostart dntcmd service
$DNT_HOME/service/dntcmd.service restart
$DNT_HOME/service/dntcmd.service start
#set autostart atakepic service
if [ $USER == 'minhthu' ]
then
$DNT_HOME/service/atakepic.service restart
$DNT_HOME/service/atakepic.service start
fi
dntcmd update 2>> "/var/dntcmd/update.log"