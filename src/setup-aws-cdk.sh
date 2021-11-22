#!/bin/bash

# curl -s "$CSM_UTILS"

# source <(curl -s "$CSM_UTILS")

h1 "Setting up AWS Cloud Development Kit"

#region=$(askWithDefault "Enter your region" "$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python3 -c 'import sys, json; print(json.load(sys.stdin)["region"])')")
#adfs_host=$(ask "Enter your ADFS Host")


while getopts a:b: flag
do
    case "${flag}" in
        a) echo " .... ${OPTARG} ....";;
        b) echo " ,,,, ${OPTARG} ,,,,";;
    esac
done


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

echo "x"
