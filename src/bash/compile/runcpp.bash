if [ "$#" -gt 0 ]
then 
    gcc -o ~/executable $1
    chmod 755 ~/executable
    args=""
    for (( i=2; i <= "$#"; i++ )); do
        args="$args ${!i}"
    done
    ~/executable $args 2> >(while read line; do echo -e "\e[1;31m$line\e[0;92m" >&2; done)
    echo;
    rm ~/executable
fi