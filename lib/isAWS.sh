#!/bin/bash

function isAWS {
  # Checking if the AWS Metadata server is reachable
  code=$(curl -s -o /dev/null -w "%{http_code}" 169.254.169.254)
  if (( $code >= 200 && $code < 300 )); then
    return 0 # true
  else
    return 1 # false
  fi
}
