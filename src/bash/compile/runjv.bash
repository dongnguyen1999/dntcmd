if [ "$#" -gt 0 ]
then
    filename=${1##*/}
    main=${filename%.*} #filename without extensions
    cd $(dirname $1)
    count=0
    timeout=50
    while [ "${PWD##*/}" != "src" -a $count -lt $timeout ]
    do
        cd ..
        count=`expr $count + 1`
    done
    if [ $count -eq $timeout ]
    then
        span RED BOLD Không tìm thấy thư mục "'src'"!
        span YELLOW Fix1: Kiểm tra lại đường dẫn truyền vào
        span YELLOW Fix2: Chia code thành các packages, gom tất cả vào 1 thư mục tên span YELLOW BOLD "'src'", span YELLOW rồi thử lại
        span RED BOLD Lưu ý: span YELLOW Nếu có sử dụng thư viện ngoài, copy các file thư viện span YELLOW BOLD .jar span YELLOW vào 1 thư mục tên span YELLOW BOLD "'lib'" span YELLOW ngang cấp với thư mục span YELLOW BOLD "'src'"
        span YELLOW TAB "|"
        span YELLOW TAB "|- ..."
        span YELLOW TAB "|- src"
        span YELLOW TAB "|- lib"
        span YELLOW TAB "|" span YELLOW TAB "|- lib1.jar"
        span YELLOW TAB "|" span YELLOW TAB "|- lib2.jar"
        span YELLOW TAB "|" span YELLOW TAB "|- ..."
        span YELLOW TAB "|- ..."
    else
        runjv_bin=../"dntcmd-runjv"
        runjv_lib=../"lib"
        if [ ! -d "$runjv_bin" ]
        then
            mkdir $runjv_bin
        fi
        if [ ! -d "$runjv_lib" ]
        then
            mkdir $runjv_lib
        fi
        find -name "*.java" > sources.txt
        javac -d $runjv_bin @sources.txt
        rm sources.txt
        cd $runjv_bin
        main=`find -name "$main.class"` # find filename.class
        main=${main//'/'/.} # replace all '/' with '.'
        main=${main%.*} # trim '.class'
        main=${main:2} # trim the first 2 dot
        find $runjv_lib -name "*.jar" > libs.txt
        libs=`cat libs.txt`
        for word in $libs
        do
            CLASSPATH=`realpath $word`:$CLASSPATH
        done
        export CLASSPATH=$CLASSPATH
        rm libs.txt
        args=""
        for (( i=2; i <= "$#"; i++ )); do
            args="$args ${!i}"
        done
        echo -e "\e[1;33mRunning $filename"
        echo -en "\e[0;92m"
        java $main $args 2> >(while read line; do echo -e "\e[1;31m$line\e[0;92m" >&2; done)
        echo -en "\e[0m"
        if [ "$?" -eq 0 ]
        then 
            span NEWLINE GREEN BOLD Kết thúc tiến trình!
        else    
            span NEWLINE RED BOLD Kết thúc tiến trình với mã lỗi $?!
        fi
        span RED BOLD Nếu xảy ra lỗi ngoài ý muốn do việc sử dụng thư viện ngoài
        span YELLOW Thử copy các file thư viện span YELLOW BOLD .jar span YELLOW vào 1 thư mục tên span YELLOW BOLD "'lib'" span YELLOW ngang cấp với thư mục span YELLOW BOLD "'src'" span YELLOW , rồi thử lại
        span YELLOW TAB "|"
        span YELLOW TAB "|- ..."
        span YELLOW TAB "|- src"
        span YELLOW TAB "|- lib"
        span YELLOW TAB "|" span YELLOW TAB "|- lib1.jar"
        span YELLOW TAB "|" span YELLOW TAB "|- lib2.jar"
        span YELLOW TAB "|" span YELLOW TAB "|- ..."
        span YELLOW TAB "|- ..."
        span YELLOW Gõ span YELLOW BOLD UNDERLINED files span BLUE UNDERLINED `realpath $runjv_lib` span YELLOW để xem thư mục span YELLOW BOLD "'lib'" span YELLOW "<--" copy các thư viện vào đây
        if [ -d "$runjv_bin" ]
        then
            rm -r $runjv_bin
        fi
    fi
fi