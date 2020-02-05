if [ "$#" -gt 0 ]
then 
    cd ~
    gcc -o executable $(realpath $1)
    chmod 755 executable;
    args=""
    for (( i=2; i <= "$#"; i++ )); do
        args="$args ${!i}"
    done
    ./executable $args;
    echo;
    rm executable;
fi