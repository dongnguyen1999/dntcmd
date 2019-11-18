#install git
sudo apt install git -y
update_path="$DNT_HOME/update"
if [ ! -d $update_path ]; then
    sudo mkdir -p $update_path > "/var/dntcmd/getupdate.log"
fi
cd $update_path
sudo git clone $UPDATE_REPO > "/var/dntcmd/getupdate.log"