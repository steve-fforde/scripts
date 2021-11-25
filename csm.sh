#!/bin/sh

# help text
if [ "$1" = "--version" ]; then
  echo "Chayote Script Manager v1.0"
  exit 0
fi

# help text
if [ "$1" = "--help" ]; then
  curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/help.txt" 
  exit 0
fi

# switch context to new shell
(
  # backup the path so we can restore it.
  __CSM_START_DIR=$(pwd)
  # run locally
  if [ "$1" = "--local" ]; then
    shift 1
    # check if script exists
    if [ -f "./src/$1.sh" ]; then
      # copy the script
      cp "./src/$1.sh" /tmp/$1.sh
      # provide function to load the libraries
      function import {
        # check that the lib exists
        if [ -f "./lib/$1.sh" ]; then
          # load the lib & make available
          source <(cat "./lib/$1.sh")
          export -f $1
        else 
          # error if does not exist
          echo "csm: script error '$1' is not a valid import."
          exit -2
        fi
        # check if there are more to load
        if (( $# > 1 )); then
          import ${@:2}
        fi
      }
      export -f import

    else
      # handle script not found
      echo "csm: '$1' is not a csm command. See 'csm --help'."
      exit -1
    fi
  else
    # check if script exists
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/steve-fforde/scripts/main/src/$1.sh")
    if (( $code >= 200 && $code < 300 )); then
      # copy the script
      curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/src/$1.sh" -o /tmp/$1.sh
      # provide function to load the libraries
      function import {
        # check that the lib exists
        code=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/steve-fforde/scripts/main/lib/$1.sh")
        if (( $code >= 200 && $code < 300 )); then
          # load the lib & make available
          source <(curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/lib/$1.sh")
          export -f $1
        else 
          # error if does not exist
          echo "csm: script error '$1' is not a valid import."
          exit -2
        fi
        # check if there are more to load
        if (( $# > 1 )); then
          import ${@:2}
        fi
      }
      export -f import
    else
      # handle script not found
      echo "csm: '$1' is not a csm command. See 'csm --help'."
      exit -1
    fi
  fi
  # set common variables
  CSM_NAME="$1"
  CSM_DIR=$(pwd)
  # export varibles for use in called script
  export CSM_NAME
  export CSM_DIR
  # call the copied script
  bash /tmp/$1.sh ${@:2}
  # revert back to calling directory
  cd $__CSM_START_DIR
)
# clean up
rm -f /tmp/$1.sh
