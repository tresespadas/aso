#!/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Sólo preciso de un parámetro"
  exit 1
fi

arr=() # Declaro el array vacio
while read -r resultado; do
  arr+=("$resultado") # Meto los resultados del find en el array
done < <(find / -name "$1" 2>/dev/null)

if [[ ${#arr[@]} -eq 0 ]]; then
  echo "No se encontraron resultados con '$1'"
  exit 0
fi

for ruta in "${arr[@]}"; do
  echo "Se encontró una coincidencia con '$1' en '$ruta'"
  if [[ -d $ruta ]]; then
    echo "Se trata de un directorio"
    echo -e "Ocupa $(stat -c %s $ruta) bytes\n"
  elif [[ -f $ruta ]]; then
    echo "Se trata de un fichero"
    echo -e "Ocupa $(stat -c %s $ruta) bytes\n"
  fi
done
