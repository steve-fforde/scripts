#!/bin/bash

import heading ask

heading "Setting up AWS Cloud Development Kit"

echo "Loading defaults..."

region=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python3 -c 'import sys, json; print(json.load(sys.stdin)["region"])')

echo ""
echo "Configure:"

region=$(ask "Enter your region" --default "$region")
adfs_host=$(ask "Enter your ADFS Host")

echo ""
echo " beta version"
echo " ++++ $region ++++"
echo " ~~~~ $# ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ $@ ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ ${@:2} ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ $@ ~~~~"
echo " ++++ $region ++++"

