echo "Downloading Skype installer..."
wget -p ~/Downloads/ https://go.skype.com/skypeforlinux-64.deb
echo "Finish downloading!"
echo "Enter password to install Skype"
sudo apt install ~/Downloads/skypeforlinux-64.deb -y
sudo rm ~/Downloads/skypeforlinux-64.deb
cp "$(dirname $0)"/skypeforlinux.desktop ~/Desktop
echo "Skype is installed!"