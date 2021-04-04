#!/bin/bash
FILE_NAME="config.properties"
function getPropVal {
    value= grep "${1}" ./$FILE_NAME|cut -d'=' -f2
	if [[ -z "$value" ]]; then
	   echo "Key not found"
	   exit 1
	fi
	echo $value
}

#Get the value with key
function testPropertyVal {
NAME=($(getPropVal 'config.name'))
echo $NAME
}

#Call the testPropertyVal function
testPropertyVal
