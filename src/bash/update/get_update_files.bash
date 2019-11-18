#install git
sudo apt install git -y 1> "/var/dntcmd/getupdate.log" 2> "/var/dntcmd/getupdate.log"
echo "Updateing..."
update_path="$DNT_HOME/update"
echo $update_path
if [ ! -d $update_path ]; then
    sudo mkdir -p $update_path
fi
cd $update_path
echo "$UPDATE_REPO"
sudo git clone $UPDATE_REPO #1> "/var/dntcmd/getupdate.log" 2> "/var/dntcmd/getupdate.log"