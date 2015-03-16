#!/bin/bash -e

CMD='9_file_size_manager_worker.sh'

function usage()
{
    echo "Usage: $script_name [-s|--size size] -- [first_nice] [second_nice]"
}

script_name=`basename $0`
MAX_SIZE=2097152

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

tmp_file_name_1=`mktemp`
tmp_file_name_2=`mktemp`

echo -e "$script_name:\tcreated tmp_file $tmp_file_name_1"
echo -e "$script_name:\tcreated tmp_file $tmp_file_name_2"

echo -e "$script_name:\tpid $$"

nice -n $nice_1 "$script_dir/$CMD" 'hello' "$tmp_file_name_1" &
pid_1=$!
echo -e "$script_name:\t$CMD started with pid $pid_1 and nice $nice_1"

nice -n $nice_2 "$script_dir/$CMD" 'world' "$tmp_file_name_2" &
pid_2=$!
echo -e "$script_name:\t$CMD started with pid $pid_2 and nice $nice_2"

sig_term_handler()
{
    trap '' EXIT
    echo -e "$script_name:\t\tterminating childs $pid_1 $pid_2"
    kill -TERM $pid_1 $pid_2
    wait $pid_1 $pid_2
    echo -e "$script_name:\t\tchilds $pid_1 $pid_2 terminated"
    exit
}

sig_usr1_handler()
{
    echo -e "$script_name:\t$$ SIGUSR1"
    rm -f "$tmp_file_name_1" "$tmp_file_name_2"
}

trap sig_term_handler SIGTERM SIGINT EXIT ERR
trap sig_usr1_handler SIGUSR1

file_size_1=0
file_size_2=0

while :
do
    if [ -e $tmp_file_name_1 ]
    then
        file_size_1=`stat --printf="%s\n" $tmp_file_name_1`
        [[ $file_size_1 =~ ^[0-9]+$ ]] || file_size_1=0
    fi

    if [ -e $tmp_file_name_2 ]
    then
        file_size_2=`stat --printf="%s\n" $tmp_file_name_2`
        [[ $file_size_2 =~ ^[0-9]+$ ]] || file_size_2=0
    fi

    if [ $file_size_1 -gt $MAX_SIZE ]
    then
        echo -e "$script_name:\tprocess with pid $pid_1 created file larger then $MAX_SIZE bytes:"
        break
    fi

    if [ $file_size_2 -gt $MAX_SIZE ]
    then
        echo -e "$script_name:\tprocess with pid $pid_2 created file larger then $MAX_SIZE bytes:"
        break
    fi

    sleep 0
done

echo -e "$script_name:\tfirst file size:\t$file_size_1"
echo -e "$script_name:\tsecond file size:\t$file_size_2"
