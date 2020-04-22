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
export DNT_SERVICE_HOME=$DNT_HOME/service
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
dntcmd update 2>> "/var/dntcmd/update.log"
sudo $DNT_SERVICE_HOME/haguichi.service restart 2>> "/var/dntcmd/service.log" >> "/var/dntcmd/service.log"
sudo $DNT_SERVICE_HOME/haguichi.service start 2>> "/var/dntcmd/service.log" >> "/var/dntcmd/service.log"