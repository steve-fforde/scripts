#!/bin/bash

function ask {
  read -p "$1: " temp < /dev/tty
  echo "$temp"  
}

function askWithDefault {
  temp=$(ask "$1 ($2): ")
  if [ "$temp" == "" ]; then
    temp="eu-west-2"
  fi

  echo "$temp"
}

function h1 {
  clear
  echo ""
  echo $1
  echo $1 | sed 's/./=/gi'
  echo ""
}
export -f h1
