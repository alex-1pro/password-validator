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


#checks if password minimum of 10 characters
valid_length()
{
    LENGTH=${#1}
  if [ $LENGTH -lt 10 ]
      then
      echo -e "${RED}The length of password need be minimum of 10 characters.${CLEAR}"
      return 1
      else
        return 0
  fi
}


# checks if password contain numbers
contain_numbers()
{
  if [[ $1 =~ [0-9] ]];
  then
    return 0
  else
    echo -e "${RED}Password need contain numbers.${CLEAR}"
    return 1
  fi
}


# checks if password contain uppercase
contain_upper_case()
{
   if [[ $1 =~ [A-Z] ]];
   then
     return 0
   else
      echo -e "${RED}Password need contain capital case letters.${CLEAR}"
      return 1
   fi
}


# checks if password contain  small case
contain_low_case()
{
   if [[ $1 =~ [a-z] ]];
   then
     return 0
   else
     echo -e "${RED}Password need contain small case letters.${CLEAR}"
     return 1
   fi
}


# get password and check if password is valid minimum 10 characters and need contain numbers, small case letters and capital letter
password_validator()
{
   valid_length "$1"
   RC=$?
   contain_numbers $1
   RC=$(($RC+$?))
   contain_upper_case $1
   RC=$(($RC+$?))
   contain_low_case $1
   RC=$(($RC+$?))
    if [ $RC -gt 0 ]
       then
         exit 1
      else
        echo -e "${GREEN}Password passed validation.${CLEAR}"
          exit 0
    fi
}



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
