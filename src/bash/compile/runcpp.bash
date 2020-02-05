if [ "$#" -gt 0 ]
then 
    gcc -o ~/executable $1
    chmod 755 ~/executable;
    args=""
    for (( i=2; i <= "$#"; i++ )); do
        args="$args ${!i}"
    done
    ~/executable $args;
    echo;
    rm ~/executable;
fi