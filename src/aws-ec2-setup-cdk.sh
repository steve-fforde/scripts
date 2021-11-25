#!/bin/bash

import ask heading isAWS

if [ "$1" = "--help" ]; then
  echo "usage: csm aws-ec2-setup-cdk [--help]

Install Cloud Dev Kit on an EC2 box.
"


  exit 0
fi

if (( ! isAWS )); then
    echo "csm aws-ec2-setup-cdk: You must run this script on an AWS EC2 server"
    exit -3
fi

heading "Setting up AWS Cloud Development Kit"

echo "Loading defaults..."

region=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python3 -c 'import sys, json; print(json.load(sys.stdin)["region"])')

echo ""
echo "Configure:"

region=$(ask "Enter your region" --default "$region")
adfs_host=$(ask "Enter your ADFS Host")

echo ""
echo " gamma version"
echo " ++++ $region ++++"
echo " ~~~~ $# ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ $@ ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ ${@:2} ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ $@ ~~~~"
echo " ++++ $region ++++"

