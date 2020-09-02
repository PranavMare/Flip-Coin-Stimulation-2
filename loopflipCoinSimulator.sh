#!/bin/bash -x

heads=0
tails=0
declare -A CoinFlip
for((i=1;i<21;i++))
do
	result=$((RANDOM%2))
	if [ $result -eq 1 ]
	then
		CoinFlip[Flip$i]=$result
		heads=$((heads+1))
	else
		CoinFlip[Flip$i]=$result
		tails=$((tails+1))
	fi
done
if [ $heads -gt $tails ]
then
	percent=$((echo"scale=2,$heads/$tails*100"|bc))
	echo "$percent"
else	
	percent=$((echo"scale=2,$tails/$heads*100"|bc))
	echo "$percent"
fi
