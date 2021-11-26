#!/bin/bash

import isAWS

echo " -- $(isAWS)"
isAWS ; echo " ++ $?"

if ! isAWS; then
  echo "csm aws-ec2-setup-lamp: You must run this script on an AWS EC2 server"
  exit 3
else
  echo "installing lamp"
fi

function try {
  lineNo=$(( lineNo++ ))
  echo "$lineNo >> $1"
  bash -c "$1"
  errCode=$?
  if [ $errCode != 0 ]; then
    echo "script error: line ${lineNo}. command '$1' failed with error ${errCode}."
    exit $errCode
  fi
}

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html

try "sudo yum update -y"
try "sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2"
try "sudo yum install -y httpd mariadb-server"
try "sudo systemctl start httpd"
try "sudo systemctl enable httpd"
try "sudo bash -c 'echo \"<html><head><title>Hello world</title></head><body><h1>Hello, world</h1></body></html>\" > /var/www/html/index.html'"
try "sudo usermod -a -G apache $(whoami)"
try "sudo chown apache:apache /var/www/html/index.html"
try "sudo chmod 660 /var/www/html/index.html"

curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python3 -c 'import sys, json; print("Site available on http://" + json.load(sys.stdin)["privateIp"])'
echo "Your profile has had the apache group added, but you will need to log off and on for it to take effect."
