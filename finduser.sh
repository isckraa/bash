#!/usr/bin/bash
#LUCA ION

if [ $# == 1 ]; then
    for users in $(cut -d: -f1,3 /etc/passwd)
    do
      if [[ $users == *$1* ]]; then
        echo $users | cut -d: -f2
      fi  
    done
else
  echo "Aucun utilisateur avec ce Login/UID"
fi