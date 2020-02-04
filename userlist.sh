#!/usr/bin/bash
#LUCA ION

awk -F : '($3 > 100) {printf "[USER : %s]\n  [UID : %s]\n",$1,$3}' /etc/passwd
