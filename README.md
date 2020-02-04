# TP 03 : Shell bash

> Le shell peut être utilisé comme un simple interpréteur de commande, mais il est aussi possible de l’utiliser comme langage de
programmation interprété (scripts).

### Exercice : paramètres `(analyse.sh)`
```shell
  #!/usr/bin/bash
  #LUCA ION

  echo "Bonjour vous avez rentré $# paramètres."
  echo "Liste des paramètres : $@."
  echo "Le nom du script est $0."
  echo "Le 3eme parametre est $3."
```
### Exercice : vérification de nombres de paramètres `(concat.sh)`
```shell
  #!/usr/bin/bash
  #LUCA ION

  if [ $# == 2 ]; then
      concat=$1$2
      echo $concat
  else
      echo "Erreur. Vous devez mettre 2 paramètres."
  fi
```
### Exercice : argument type et droits `(test-fichier.sh)`
```shell
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
```
### Exercice : Afficher le contenu d'un répertoire `(listedir.sh)`
```shell
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
```
### Exercice : Lister les utilisateurs `(userlist.sh)`
```shell
  #!/usr/bin/bash
  #LUCA ION

  awk -F : '($3 > 100) {printf "[USER : %s]\n  [UID : %s]\n",$1,$3}' /etc/passwd
```
### Exercice : Mon utilisateur existe t'il `(finduser.sh)`
```shell
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
```
### Exercice : Creation utilisateur `(useradd.sh)`
```shell
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
```
### Exercice : Lecture au clavier `(keyboard.sh)`
- La commande read permet de lire une chaîne et de l'affecter à une variable.
- Les informations sur le contenu d'un fichier peuvent être afficher avec la commande file
- La commande more permet d'affiché page par page les fichiers de texte

> Comment quitter more... ?
- Il suffit d'utiliser `q`

> Comment avancer d'une ligne ?
- Il faut utiliser `s`

> Comment avancer d’une page ?
- Il suffit d'utiliser `b`

> Comment chercher une chaîne de caractères ? Passer à l’occurence suivante ?
- `grep -E "chaîne_de_caractère"`

```shell
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
```
### Exercice : Appréciation `(appreciation.sh)`
```shell
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
```
