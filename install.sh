#!/bin/sh

if [ $EUID -ne 0 ]; then
    echo "csm installer: you must run this command as sudo"
    exit 1
fi

sudo bash -c "echo '( curl -s \"https://raw.githubusercontent.com/steve-fforde/scripts/main/csm.sh\" -o /tmp/csm.sh && bash /tmp/csm.sh $@ ) ;  rm -f /tmp/csm.sh' > /usr/local/sbin/csm"
sudo chmod +x /usr/local/sbin/csm

csm --version
csm --help
