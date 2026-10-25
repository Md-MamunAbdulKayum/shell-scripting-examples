#!/usr/bin/env bash

FRUIT_NAME=$1
if [ "$FRUIT_NAME" = "Olive" ]; then
  echo "The fruit name is Olive"
else
  echo "The fruit is not Olive"
fi

AGE=$2

if [ -z "$AGE" ]; then
  echo "Usage: $0 <fruit_name> <age>" >&2
  exit 1
fi

if [ "$AGE" -lt 13 ]; then
  echo "You're a child"
elif [ "$AGE" -ge 13 ] && [ "$AGE" -lt 19 ]; then
  echo "You're a teenager"
else
  echo "You're a perfect fit!"
fi
