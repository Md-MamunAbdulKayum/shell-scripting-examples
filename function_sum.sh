#!/usr/bin/env bash

#Functions to add two numbers
function addNumbers() {
  local number1=10
  local number2=50
  local sum=$((number1+number2))
  echo "Summation is: $sum"
 }
 
 #Call the function
 addNumbers