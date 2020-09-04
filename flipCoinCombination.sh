#! /bin/bash

randomCheck=$((RANDOM%2))
if [[ $randomCheck -eq 1 ]]
then
    echo "Heads"
else
    echo "Tail"
fi

declare -A Coin
H=0
T=0

for (( i=0 ; i<10 ; i++ ))
do
    rand_singlet_check=$((RANDOM%2))
    case $rand_singlet_check in 
        1 )
            H=$((H+1))
            Coin[H]=$H;;
        0 )
            T=$((T+1))
            Coin[T]=$T;;
    esac
done

for index in ${!Coin[@]}
do
    echo "$index - ${Coin[$index]}"
    if [[ $index -eq H ]]
    then
        echo "Singlet Head Percentage H : `echo "scale=1; ${Coin[$index]}*100/10" | bc ` %" 
        
    else
        echo "Singlet Head Percentage H : `echo "scale=1; ${Coin[$index]}*100/10" | bc ` %"
    fi
done