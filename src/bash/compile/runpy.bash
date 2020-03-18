if [ "$#" -gt 0 ]
then 
    filename=${1##*/}
    if [ "$#" -gt 1  -a  "$2" == "py2" ]
    then
        echo -e "\e[1;33mRunning $filename with python2"
        echo -en "\e[0;92m"
        python $@ 2> >(while read line; do echo -e "\e[1;31m$line\e[0;92m" >&2; done)
    else
        echo -e "\e[1;33mRunning $filename with python3"
        echo -en "\e[0;92m"
        python3 $@ 2> >(while read line; do echo -e "\e[1;31m$line\e[0;92m" >&2; done)
    fi
    echo -en "\e[0m"

    if [ "$?" -eq 0 ]
    then 
        span NEWLINE GREEN BOLD Kết thúc tiến trình!
    else    
        span NEWLINE RED BOLD Kết thúc tiến trình với mã lỗi $?!
    fi
fi