#!/bin/sh

# help text
if [ "$1" = "--help" ]; then
  echo "usage: csm [--help] 
           <command> [<args>]

Chayote Script Manager
These are common CSM commands used in various situations:

For use on AWS boxes:
   setup-aws-cdk      Install CDK on an EC2 box.

For use inside a GIT project:
   git-open           Opens the git project in the defauklt browser
"

  exit 0
fi

# switch context to new shell
(
  # check if script exists
  code=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/steve-fforde/scripts/main/src/$1.sh")
  if (( $code >= 200 && $code < 300 )); then
    # copy the script
    curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/src/$1.sh" -o /tmp/$1.sh
    # backup the path so we can restore it.
    __CSM_START_DIR=$(pwd)
    # set common variables
    CSM_NAME="$1"
    CSM_SRC_DIR="https://raw.githubusercontent.com/steve-fforde/scripts/main/src"
    CSM_START_DIR=$(pwd)
    CSM_UTILS="https://raw.githubusercontent.com/steve-fforde/scripts/main/lib/utilities.sh"
    # export varibles for use in called script
    export CSM_NAME
    export CSM_SRC_DIR
    export CSM_START_DIR
    export CSM_UTILS
    # call the copied script
    curl -s "$CSM_UTILS"
    source <(curl -s "$CSM_UTILS")
    bash /tmp/$1.sh ${@:2}
    # revert back to calling directory
    cd $__CSM_START_DIR
  else
    # handle script not found
    echo "csm: '$1' is not a csm command. See 'csm --help'."
  fi
)
# clean up
rm -f /tmp/$1.sh
