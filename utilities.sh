#!/bin/bash

function askWithDefault {
  read -p "$1 ($2): " temp < /dev/tty
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