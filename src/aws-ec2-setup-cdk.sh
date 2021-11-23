#!/bin/bash

import heading ask

heading "Setting up AWS Cloud Development Kit"

aws=$(nc -v -z -w 3 169.254.169.254 80 2>/dev/null && echo yes || echo no)

if [ $aws = "no" ]; then
    echo "csm aws-ec2-setup-cdk: You must run this script on an AWS EC2 server"
    exit -3
fi

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

