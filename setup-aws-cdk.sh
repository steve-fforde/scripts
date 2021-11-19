#!/bin/sh

source <(curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/utilities.sh")

h1 "Setting up AWS Cloud Development Kit"

region=$(askWithDefault "Enter your region" "eu-west-2")
adfs_host=$(ask "Enter your ADFS Host")


echo ""
echo " ++++ $region ++++"
echo " ++++ $region ++++"
echo " ++++ $region ++++"

echo "x"
