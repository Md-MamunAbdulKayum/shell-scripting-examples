#!/usr/bin/env bash

#Function with function keyword
#Functions name starts with a verb
function sayHello() {
  local NAME=$1
  echo "Hello $NAME. Welcome to shellscripting."
 }

#Function without function keyword
sayGoodbye() {
  echo "Goodbye $1. See you later."
}

#Functions are invoked as normal shell command
echo "Calling the sayHello function with param"
sayHello Olive

echo "Calling the sayGoodbye function"
sayGoodbye Olivia

exit 0

