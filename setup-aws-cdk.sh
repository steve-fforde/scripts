#!/bin/sh

source <(curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/utilities.sh")

h1 "Setting up AWS Cloud Development Kit"

region=$(askWithDefault "Enter your region" "$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python3 -c 'import sys, json; print(json.load(sys.stdin)["region"])')")
adfs_host=$(ask "Enter your ADFS Host")

echo "$@"

echo ""
echo " ++++ $region ++++"
echo " ++++ $region ++++"
echo " ++++ $region ++++"

echo "x"
