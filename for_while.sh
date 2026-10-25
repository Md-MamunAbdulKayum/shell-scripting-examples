#!/usr/bin/env bash

NUMBERS=$@

for NUMBER in $NUMBERS
do
 if [ "$NUMBER" -lt 10 ]; then
  continue
 fi
  echo "Number is greater than or equal to 10: $NUMBER"
done

echo "for loop completed."

COUNTER=0
while [ "$COUNTER" -le 5 ]
do
 echo "COUNT = $COUNTER"
 ((COUNTER++))
done

echo "while loop completed."
exit 0
