#!/bin/bash

#if the variable VAR is not set, set num=20 
num=${VAR:-20}
echo $num

#Another way(best)
a=20
b=30
val=$([ "$a" == 5 ] && echo "$a" || echo "$b")
echo $val

#This one is best for only numeric comparisons and assignments
c=40
d=50
test="abc"
value=$(( a==20 ? c : d ))
echo $value