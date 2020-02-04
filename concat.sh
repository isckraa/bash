#!/usr/bin/bash
#LUCA ION

if [ $# == 2 ]; then
    concat=$1$2
    echo $concat
else
    echo "Erreur. Vous devez mettre 2 paramètres."
fi
