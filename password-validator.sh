#!/bin/bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
# Clear the color after that
CLEAR='\033[0m'

#check if password minimum of 10 characters
LENGTH=${#1}
if [ $LENGTH -lt 10 ]
    then
    echo -e "${RED}The length of password need be minimum of 10 characters.${CLEAR}"
    exit 1
fi

# checks if password contain numbers
if [[ $1 =~ [0-9] ]]; then

  # checks if password contain uppercase
  if [[ $1 =~ [A-Z] ]]; then

    # checks if password contain  small case
    if [[ $1 =~ [a-z] ]]; then
        echo -e "${GREEN}Password pass validation.${CLEAR}"
        exit 0
      else
        echo -e "${RED}Password need contain small case leeters.${CLEAR}"
        exit 1
      fi

  else
      echo -e "${RED}Password need contain capital case letters.${CLEAR}"
    exit 1
  fi

else
      echo -e "${RED}Password need contain numbers.${CLEAR}"
    exit 1
fi


