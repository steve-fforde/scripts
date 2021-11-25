#!/bin/bash

sudo bash -c "echo '( curl -s \"https://raw.githubusercontent.com/steve-fforde/scripts/main/csm.sh\" -o /tmp/csm.sh && bash /tmp/csm.sh \$@ ) ;  rm -f /tmp/csm.sh' > /usr/local/sbin/csm"
sudo chmod +x /usr/local/sbin/csm

csm --version
csm --help
