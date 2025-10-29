#!/bin/env bash

ruta_log="/tmp/salida_log_script5.sh"

(mkdir "$HOME/dir" && touch "$HOME/cabello.txt") &>/dev/null
if [[ $? -ne 0 ]]; then
  echo "$(date) - Fallo en la creación de directorio y archivo en $HOME" >> $ruta_log
  exit 1
else
  echo "$(date) - Creación de directorio y archivo en $HOME" >> $ruta_log
fi

(mkdir /root/dir && touch /root/cabello.txt) &>/dev/null
if [[ $? -ne 0 ]]; then
  echo "$(date) - Fallo en la creación de directorio y archivo en /root" >> $ruta_log
  exit 1
else
  echo "$(date) - Creación de directorio y archivo en /root" >> $ruta_log
fi
