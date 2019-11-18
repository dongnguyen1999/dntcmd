#install git
sudo apt install git -y 1> "/var/dntcmd/getupdate.log" 2> "/var/dntcmd/getupdate.log"
echo "Updateing..."
DNT_HOME=`cat $home_path` 
UPDATE_REPO="https://dongnguyen1999:Dong1357432589@github.com/dongnguyen1999/dntcmd.git"
update_path="$DNT_HOME/update"
echo $DNT_HOME
if [ ! -d $update_path ]; then
    sudo mkdir -p $update_path
fi
cd $update_path
echo "$UPDATE_REPO"
sudo git clone $UPDATE_REPO 1> "/var/dntcmd/getupdate.log" 2> "/var/dntcmd/getupdate.log"