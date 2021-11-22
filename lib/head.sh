#!/bin/bash

function head {
  clear
  echo ""
  echo $1
  echo $1 | sed 's/./=/gi'
  echo ""
}