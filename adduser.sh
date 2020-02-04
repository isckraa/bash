#!/usr/bin/bash
#LUCA ION
 
if [ $USER == "root" ]; then 
  #SET LOGIN
  echo "Login : "
  read -n10 -e login
  
  HOME=$login
  
  #SET GIT
  echo "GID :"
  read -n10 -e gid
  
  #SET UID
  echo "UID :"
  read -n10 -e id
  
  #SET COMMENT
  echo "Comments :"
  read -n10 -e comment
  
  if [ -d "/homme/$login" ]; then
    echo "Répertoire déjà existant."
    echo "Entrer un autre login."
    red -n10 HOME
  fi
  
  #ADD USER
  useradd "$login" --uid "$id" --home "/home/$HOME" --create-home --gid "$gid" --comment "$comment"
 
 
  if [ $? -eq 0 ]; then
    echo "Utilisateur créé avec succès"
  fi
 
else
  echo "Erreur lors de la création de l'utilisateur"
fi