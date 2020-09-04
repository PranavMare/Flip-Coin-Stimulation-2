#!/bin/bash
randomCheck=$((RANDOM%2))
if [[ $randomCheck -eq 0 ]]
then
    echo "Heads "
else
    echo "Tail"
fi

declare -A Singlet
H=0
T=0

for (( i=0 ; i<10 ; i++ ))
do
    rand_singlet_check=$((RANDOM%2))
    case $rand_singlet_check in 
        0 )
            H=$((H+1))
            Singlet[H]=$H;;
        1 )
            T=$((T+1))
            Singlet[T]=$T;;
    esac
done

for index in ${!Singlet[@]}
do
    echo "$index - ${Singlet[$index]}"
    if [[ $index -eq H ]]
    then
        echo "Singlet Head Percentage H : `echo "scale=1; ${Singlet[$index]}*100/10" | bc ` %"    
    else
        echo "Singlet Tail Percentage T : `echo "scale=1; ${Singlet[$index]}*100/10" | bc ` %"
    fi
done

declare -A Doublet
HH=0
TT=0
HT=0
TH=0

for (( i=0 ; i<10 ;i++ ))
do
    rand_doublet_check1=$((RANDOM%2))
    rand_doublet_check2=$((RANDOM%2))
    
    case $rand_doublet_check1-$rand_doublet_check2 in
        0-0 )
            HH=$((HH+1))
            Doublet[HH]=$H;;
        1-1 )
            TT=$((TT+1))
            Doublet[TT]=$T;;
        0-1 )
            HT=$((HT+1))
            Doublet[HT]=$HT;;
        1-0 )
            TH=$((TH+1))
            Doublet[TH]=$TH;;
    esac
done

for index in ${!Doublet[@]}
do
    echo "$index - ${Doublet[$index]}"
    if [[ $index -eq HH ]]
    then
        echo "Doublet Head Percentage HH : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    elif [[ $index -eq TT ]]
    then
        echo "Doublet Tail Percentage TT : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    elif [[ $index -eq HT ]]
    then
        echo "Doublet HeadTail Percentage HT : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    else
        echo "Doublet TailHead Percentage TH : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    fi
done