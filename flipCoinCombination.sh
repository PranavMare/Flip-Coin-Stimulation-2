#!/bin/bash -x

result=$((RANDOM%2))

if [ $result -eq 1 ]
then
	echo "Heads"
else
	echo "Tails"
fi
