#!/usr/bin/bash
#LUCA ION

users=$(whoami)

# Vérification si le fichier existe
if [ ! -e $1 ]; then
    echo "Le fichier $1 n'existe pas."
    exit 1
else
    echo "Le fichier $1 existe."
fi

# Vérification si c'est un fichier ordinaire vide ou pas
if [ -f $1 ]; then
    echo "Le fichier $1 est un fichier ordinaire."
    if [ -s $1 ]; then
        echo "Le fichier '$1' est un fichier ordinaire qui n'est pas vide."
    fi
fi

# Vérification si c'est un dossier
if [ -d $1 ]; then
    echo "Le fichier '$1' est un répertoire."
fi

# Test des droits
if [ -r $1 ]; then
    r="Lecture"
fi

if [ -x $1 ]; then
    x="Exécution"
fi

if [ -w $1 ]; then
    w="Ecriture"
fi

echo "La personne $users a les droits de : $r $x $w"
