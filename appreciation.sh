#!/usr/bin/bash
#LUCA ION

echo "(q): quitter"
echo "Bonjour."
read -p "Entrer votre note :" note

if [[ $note =~ ^-?[0-9]+$ ]]; then
    if [ $note = "q" ]; then
        echo "Au revoir!"
        exit 0
    elif [ $note -gt 20 ]; then
        echo "Entrez une note comprise entre 0 et 20"
    elif [ $note -ge 16 ]; then
        echo "Très bien"
    elif [ $note -ge 14 ]; then
        echo "Bien"
    elif [ $note -ge 12 ]; then
        echo "Assez bien"
    elif [ $note -ge 10 ]; then
        echo "Moyen"
    elif [ $note -ge 0 ]; then
        echo "Insuffisant"
    fi
else
    echo "Veuillez entrez une valeur numérique."
fi