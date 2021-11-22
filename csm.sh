#!/bin/sh

# display help text
if [ "$1" = "--help" ]; then
  echo "usage: csm [--help] 
           <command> [<args>]

These are common CSM commands used in various situations:

For use on AWS boxes:
   setup-aws-cdk      Install CDK on an EC2 box."

  exit 0
fi

(
  code=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/steve-fforde/scripts/main/src/$1.sh")
  if (( $code >= 200 && $code < 300 )); then
    curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/src/$1.sh" -o /tmp/$1.sh
    __CSM_START_DIR=$(pwd)
    CSM_REMOTE="https://raw.githubusercontent.com/steve-fforde/scripts/main/"
    CSM_NAME="$1"
    export CSM_REMOTE
    export CSM_NAME
    bash /tmp/$1.sh ${@:2}
    cd $__CSM_START_DIR
  else
    echo "csm: ${code}: '$1' is not a csm command. See 'csm --help'."
  fi
)
rm -f /tmp/$1.sh
