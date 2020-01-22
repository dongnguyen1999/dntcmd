echo "Downloading Visual Studio Code installer..."
cd ~/Downloads
wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
echo "Finish downloading!"
echo "Enter password to install Visual Studio Code"
sudo apt install ./vscode.deb -y
sudo rm ./vscode.deb
cp "$(dirname $0)"/code.desktop ~/Desktop
echo "Visual Studio Code is installed!"