#!/bin/env bash

echo -e "El nombre del script es $0, se le han pasado $# parámetros que son los siguientes:\n"
for i in $@; do
  echo "$i"
done
echo -e "\nEl usuario que ha ejecutado este script es $USER y su uid es $UID, su directorio home reside en $HOME"
echo "La fecha de hoy es $(date +%c)"
