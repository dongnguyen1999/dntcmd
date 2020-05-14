echo "\e[0;33mInstalling kazam video recorder..."
sudo apt install -y kazam
sudo cp "$(dirname $0)"/kazam_icon.png /usr/share/pixmaps
cp "$(dirname $0)"/kazam.desktop ~/Desktop
echo "\e[0;32mKazam is installed!"