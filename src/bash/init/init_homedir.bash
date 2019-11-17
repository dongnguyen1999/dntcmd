#require $1 as home directory
#set home before install: to $1 or pwd
home=$PWD
if [ "$#" -gt 0 ]; then
    if [ ! -d "$1" ]; then
        sudo mkdir -p "$1"
    fi
    home=$1
fi
echo "export PATH=$PATH:$home" >> ~/.bashrc
if [ ! -d "/var/dntcmd" ]; then
    sudo mkdir -p "/var/dntcmd"
    sudo chmod 777 /var/dntcmd
fi
sudo echo "$home" > /var/dntcmd/DNT_HOME

