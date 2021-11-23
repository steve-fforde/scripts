#!/bin/bash

import heading ask

heading "Setting up AWS Cloud Development Kit"

region=$(ask "Enter your region" --default "$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python3 -c 'import sys, json; print(json.load(sys.stdin)["region"])')")
adfs_host=$(ask "Enter your ADFS Host")

echo ""
echo " ++++ $region ++++"
echo " ~~~~ $# ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ $@ ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ ${@:2} ~~~~"
echo " ++++ $region ++++"
echo " ~~~~ $@ ~~~~"
echo " ++++ $region ++++"

