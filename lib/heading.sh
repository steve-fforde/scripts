#!/bin/bash

function heading {
  clear
  echo ""
  echo $1
  echo $1 | sed 's/./=/gi'
  echo ""
}