#!/usr/bin/env bash
echo Today date is : $(date)

#Date format yyyy-mm-dd
date=$(date '+%Y-%m-%d')
echo $date 

#Date format yyyy-mm-dd HH:MM:SS
date2=$(date '+%Y-%m-%d %H:%M:%S')
echo $date2

echo $(date '+%Y-%m-%d')