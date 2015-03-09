#!/bin/bash

function usage()
{
    echo "Usage: $script_name [-s|--size size] -- [first_nice] [second_nice]"
}

script_name=`basename $0`
MAX_SIZE=128

while true
do
    case "$1" in
        -s|--size)
            MAX_SIZE=$2
            [[ $MAX_SIZE =~ ^[0-9]+$ ]]  ||
            {
                usage
                echo -e "\t\"$MAX_SIZE\" is not a number"
                exit 1
            }
            shift 2
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Invalid option: $1"
            exit 4
            ;;
        *)
            break
            ;;
    esac
done

nice_1=2
nice_2=19

if [ $# -ne 0 ]
then
    nice_1=$1
    [[ $nice_1 =~ ^[0-9]+$ ]]  ||
    {
        usage
        echo -e "\tfirst nice param is not a number"
        exit 2
    }
    shift
fi

if [ $# -ne 0 ]
then
    nice_2=$1
    [[ $nice_2	 =~ ^[0-9]+$ ]]  ||
    {
        usage
        echo -e "\tsecond nice param is not a number"
        exit 3
    }
    shift
fi

script_full_path=`readlink -e "$0"`
script_dir=`dirname "$script_full_path"`

cmd='2_inf_loop_echo.sh'

tmp_file_name_1=`mktemp`
tmp_file_name_2=`mktemp`

echo "created tmp_file $tmp_file_name_1"
echo "created tmp_file $tmp_file_name_2"

nice -n $nice_1 { echo 'hello' > $tmp_file_name_1 &
pid_1=$!
echo "$cmd started with pid $pid_1 and nice $nice_1"

nice -n $nice_2 "$script_dir/$cmd" 'deadb' > $tmp_file_name_2 &
pid_2=$!
echo "$cmd started with pid $pid_2 and nice $nice_2"

trap 'rm -f "$tmp_file_name_1" "$tmp_file_name_2"; kill -TERM "$pid_1" "$pid_2"' EXIT

file_size_1=0
file_size_2=0

while true
do
    file_size_1=`du -b $tmp_file_name_1 | awk '{print $1}'`
    file_size_2=`du -b $tmp_file_name_2 | awk '{print $1}'`

    if [ $file_size_1 -gt $MAX_SIZE ]
    then
        echo "process with pid $pid_1 created larger then $MAX_SIZE file:"
        break
    fi

    if [ $file_size_2 -gt $MAX_SIZE ]
    then
        echo "process with pid $pid_2 created larger then $MAX_SIZE file:"
        break
    fi
done

echo -e "first file size:\t$file_size_1"
echo -e "second file size:\t$file_size_2"

