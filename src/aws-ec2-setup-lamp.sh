#!/bin/bash

local lineNo=1

function try {
  lineNo=$(( lineNo++ ))
  bash -c "$1"
  errCode=$?
  if [ $errCode != 0 ]; then
    echo "script error: line ${lineNo}. command '$1' failed with error ${errCode}."
    exit $errCode
  fi
}

try "sudo yum update -y"
try "sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2"
try "sudo yum install -y httpd mariadb-server"
try "sudo systemctl start httpd"
try "sudo systemctl enable httpd"
try "sudo bash -c 'echo \"\<h1\>Hello, world\</h1\>\" > /var/www/index.html'"
try "sudo usermod -a -G apache $(whoami)"
try "sudo chown apache:apache /var/www/index.html"
try "sudo chmod 660 /var/www/index.html"
