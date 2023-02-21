#!/usr/bin/env bash

#Functions to add two numbers
function addNumbers() {
  local number1=$1
  local number2=$2
  local sum=$((number1+number2))
  #Returning the value, 
  #echo will act as a return statement if we call this function like below with $
  echo "$sum"
 }
 
 #Call the function and passing the parameter, assiging the returned value to 
 #new variable summation
 summation=$(addNumbers 10 50)
 echo "Summation is: $summation"