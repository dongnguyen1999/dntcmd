if [ "$#" -gt 0 ]
then 
    if [ "${1##*.}" == "cpp" ] 
    then
        g++ -o ~/executable $1
    else 
        gcc -o ~/executable $1
    fi
    chmod 755 ~/executable
    args=""
    for (( i=2; i <= "$#"; i++ )); do
        args="$args ${!i}"
    done
    filename=${1##*/}
    echo -e "\e[1;33mRunning $filename"
    echo -en "\e[0;92m"
    ~/executable $args 2> >(while read line; do echo -e "\e[1;31m$line\e[0;92m" >&2; done)
    echo -en "\e[0m"
    if [ "$?" -eq 0 ]
    then 
        span NEWLINE GREEN BOLD Kết thúc tiến trình!
    else    
        span NEWLINE RED BOLD Kết thúc tiến trình với mã lỗi $?!
    fi
    echo;
    rm ~/executable
fi