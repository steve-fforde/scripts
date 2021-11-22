#!/bin/bash

function ask {
  read -p "$1: " temp < /dev/tty
  echo "$temp"  
}

#function askWithDefault {
#  temp=$(ask "$1 ($2): ")
#  if [ "$temp" == "" ]; then
#    temp="eu-west-2"
#  fi
#
#  echo "$temp"
#}

