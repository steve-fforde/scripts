#!/bin/bash

function isAWS {
  code=$(curl -s -o /dev/null -w "%{http_code}" 169.254.169.254)
  if (( $code >= 200 && $code < 300 )); then
    echo 1
  else
    echo 0
  fi
}
