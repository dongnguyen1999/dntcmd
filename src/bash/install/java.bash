echo "\e[0;33mInstalling java default jre..."
sudo apt install -y default-jre
java -version >> "/var/dntcmd/install.log"
if [ "$?" -eq 0 ]
then
    echo "\e[32mInstalled:"
    java -version
fi
echo "\e[0;33mInstalling java default jdk..."
sudo apt install -y default-jdk
jdkVer=`javac -version`
if [ "$?" -eq 0 ]
then
    echo "\e[32mInstalled:"
    echo $jdkVer
fi