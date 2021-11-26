#!/bin/bash

function isAWS {
  #return $(nc -v -z -w 3 169.254.169.254 80 2>/dev/null && echo 1 || echo 0)
  return 0
}
