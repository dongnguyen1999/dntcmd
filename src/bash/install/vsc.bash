echo "\e[0;33mDownloading Visual Studio Code installer..."
cd ~/Downloads
wget -O vscode.deb https://download.heise.de/files/17icPw7Buc0XgdugUmZLIw/278368/code_1.41.0-1576089540_amd64.deb?expires=1580793421
echo "\e[0;32mFinish downloading!"
echo "\e[0;33mEnter password to install Visual Studio Code"
sudo apt install ./vscode.deb -y
sudo rm ./vscode.deb
cp "$(dirname $0)"/code.desktop ~/Desktop
echo "\e[0;32mVisual Studio Code is installed!"