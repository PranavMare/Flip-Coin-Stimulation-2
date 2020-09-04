#!/bin/bash
randomCheck=$((RANDOM%2))
if [[ $randomCheck -eq 0 ]]
then
    echo "Heads "
else
    echo "Tail"
fi


num=20
declare -A Singlet
H=0
T=0

for (( i=0 ; i<$num ; i++ ))
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
        echo "Singlet Head Percentage H : `echo "scale=1; ${Singlet[$index]}*100/20" | bc ` %"    
    else
        echo "Singlet Tail Percentage T : `echo "scale=1; ${Singlet[$index]}*100/20" | bc ` %"
    fi
done

declare -A Doublet
HH=0
TT=0
HT=0
TH=0
#Doublet Combination : HH ,TT,HT,TH 
for (( i=0 ; i<$num ;i++ ))
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
        echo "Doublet Head Percentage HH : `echo "scale=1; ${Doublet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq TT ]]
    then
        echo "Doublet Tail Percentage TT : `echo "scale=1; ${Doublet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HT ]]
    then
        echo "Doublet HeadTail Percentage HT : `echo "scale=1; ${Doublet[$index]}*100/20" | bc ` %" 
    else
        echo "Doublet TailHead Percentage TH : `echo "scale=1; ${Doublet[$index]}*100/20" | bc ` %" 
    fi
done

declare -A Triplet
HHH=0
HHT=0
HTH=0
HTT=0
TTT=0
THH=0
THT=0
TTH=0

for (( i=0 ; i<$num ; i++ ))
do
    rand_triplet_check1=$((RANDOM%2))
    rand_triplet_check2=$((RANDOM%2))
    rand_triplet_check3=$((RANDOM%2))

    case $rand_triplet_check1-$rand_triplet_check2-$rand_triplet_check3 in
        0-0-0 )
            HHH=$((HHH+1))
            Triplet[HHH]=$HHH;;
        0-0-1 )
            HHT=$((HHT+1))
            Triplet[HHT]=$HHT;;
        0-1-0 )
            HTH=$((HTH+1))
            Triplet[HTH]=$HTH;;
        0-1-1 )
            HTT=$((HTT+1))
            Triplet[HTT]=$HTT;;
        1-1-1 )
            TTT=$((TTT+1))
            Triplet[TTT]=$TTT;;
        1-0-0 )
            THH=$((THH+1))
            Triplet[THH]=$THH;;
        1-0-1 )
            THT=$((THT+1))
            Triplet[THT]=$THT;;
        1-1-0 )
            TTH=$((TTH+1))
            Triplet[TTH]=$TTH;;
    esac
done

for index in ${!Triplet[@]}
do
    echo "$index - ${Triplet[$index]}"
    if [[ $index -eq HHH ]]
    then
        echo "Triplet HHH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HHT ]]
    then
        echo "Triplet HHT percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HTH ]]
    then
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HTT ]]
    then
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq TTT ]]
    then
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq THH ]]
    then
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq THT ]]
    then
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    else
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    fi
done

arr[0]=${Singlet[H]}
arr[1]=${Singlet[T]}
arr[2]=${Doublet[HH]}
arr[3]=${Doublet[HT]}
arr[4]=${Doublet[TH]}
arr[5]=${Doublet[TT]}
arr[6]=${Triplet[HHH]}
arr[7]=${Triplet[HHT]}
arr[8]=${Triplet[HTH]}
arr[9]=${Triplet[HTT]}
arr[10]=${Triplet[TTT]}
arr[11]=${Triplet[THH]}
arr[12]=${Triplet[THT]}
arr[13]=${Triplet[TTH]}
echo ${arr[@]}

len=${#arr[@]}

for (( i=0 ; i<len ;i++ ))
do
    for (( j=0 ; j<len-i-1 ; j++ ))
    do
        if [[  ${arr[j]} -gt ${arr[$((j+1))]} ]]
        then
                temp=${arr[j]}
                arr[j]=${arr[$((j+1))]}
                arr[$((j+1))]=$temp
        fi
    done
done

echo ${arr[@]}

echo ${arr[13]} " is the WINNER !!!"