#!/usr/bin/bash
#LUCA ION

if [ $# -ne 1 ]; then
    echo "Vauillez rentrer le nom d'un répertoire."
fi

if [ ! -d $1 ]; then
    echo "Le fichier $1 n'est pas un répertoire."
fi

echo "####### fichiers dans $1"
find $1 -type f -printf "/$1%f\n"

echo "####### repertoires dans /boot/"
find $1 -mindepth 1 -maxdepth 1 -type d -printf "/$1%f\n"
