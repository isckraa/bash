#!/usr/bin/bash
#LUCA ION

repo=$(find $1)

for file in $repo; do
    
    type=$(file -b $file)

    for data in $type; do
        if [[ $data = *"text"* ]] ; then
        
            echo -n "voulez vous visualiser le fichier ${file%/} (yes/no)"
            read fichier
            
            if [[ 'grep 'yes' $fichier' ]]; then
                more $file
            fi
        fi
    done
done