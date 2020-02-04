echo "\e[0;33mDownloading Skype installer..."
cd ~/Downloads
wget https://go.skype.com/skypeforlinux-64.deb
echo "\e[0;32mFinish downloading!"
echo "\e[0;33mEnter password to install Skype"
sudo apt install ./skypeforlinux-64.deb -y
sudo rm ./skypeforlinux-64.deb
cp "$(dirname $0)"/skypeforlinux.desktop ~/Desktop
echo "\e[0;32mSkype is installed!"