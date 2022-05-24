#!/bin/bash

 # Color variables
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  # Clear the color after that
  CLEAR='\033[0m'

# help
help()
{
  echo "This script is for password validation"
  echo "Validation passed if password contains minimum 10 characters, numbers, small case letters and capital letter"
  echo "Syntax: scriptTemplate [h|f]"
  echo "options:"
  echo "h    Print this help."
  echo "f    Get path of file and password retrieved from file"
}


# get password and check if password is valid minimum 10 characters and need contain numbers, small case letters and capital letter
password_validator()
{
  #checks if password minimum of 10 characters
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
          echo -e "${GREEN}Password passed validation.${CLEAR}"
          exit 0
        else
          echo -e "${RED}Password need contain small case letters.${CLEAR}"
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
}


############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options

while getopts ":hf:" option; do
  case $option in
  h) # display help
     help
     exit;;
  f) # get password from file
      file=$OPTARG
      PASSWORD=$(cat "$file")
      password_validator $PASSWORD;;
  \?) # Invalid option
       echo -e "${RED}Error: Invalid option${CLEAR}"
       exit;;
  esac
done

password_validator $1
