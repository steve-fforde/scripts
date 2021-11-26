#!/bin/bash

function isAWS {
  code=$(curl -s -o /dev/null -w "%{http_code}" 169.254.169.254)
  echo "AWS Reflector responded with HTTP Status $code"
  if (( $code >= 200 && $code < 300 )); then
    return 0 # true
  else
    return 1 # false
  fi
}
