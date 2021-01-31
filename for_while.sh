#!/usr/bin/env bash

NUMBERS=$@

for NUMBER in $NUMBERS
do
 if [ $NUMBER -lt 10 ]; then
  continue
 fi
  echo "Number is less or greater than 10, number: $NUMBER"
done

echo "for loop completed."

COUNTER=0
while [ $COUNTER -le 5 ]
do
 echo "COUNT = $COUNTER"
 ((COUNTER++))
done

echo "while loop completed."
exit 0
