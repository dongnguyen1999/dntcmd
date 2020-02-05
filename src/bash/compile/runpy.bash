if [ "$#" -gt 0 ]
then 
    python3 $@ 2> >(while read line; do echo -e "\e[1;31m$line\e[0;92m" >&2; done)
fi