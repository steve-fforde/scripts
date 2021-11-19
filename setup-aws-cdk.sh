#!/bin/sh

source <(curl "https://raw.githubusercontent.com/steve-fforde/scripts/main/utilities.sh")

clear
echo ""
echo "Setting up AWS Cloud Development Kit"
echo "===================================="
echo ""


region=$(askWithDefault "Enter your region" "eu-west-2")


echo ""
echo " ++++ $region ++++"
echo " ++++ $region ++++"
echo " ++++ $region ++++"

echo "x"
