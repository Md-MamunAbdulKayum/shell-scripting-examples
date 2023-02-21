#!/usr/bin/env bash

#Functions to add two numbers
function addNumbers() {
  local number1=$1
  local number2=$2
  local sum=$((number1+number2))
  echo "Summation is: $sum"
 }
 
 #Call the function and passing the parameter
 addNumbers 10 50