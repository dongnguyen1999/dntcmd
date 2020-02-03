if [ "$#" -gt 0 ]
then 
    sudo gcc -o executable $1;
    sudo chmod 755 executable;
    args=""
    for (( i=2; i <= "$#"; i++ )); do
        args="$args ${!i}"
    done
    ./executable $args;
    echo;
    sudo rm executable;
fi