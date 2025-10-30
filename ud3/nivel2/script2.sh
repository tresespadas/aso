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
  if [[ -r $ruta ]]; then
    echo -e "Tiene permisos de escritura. Se procese a mostrar el contenido\n"
    cat $ruta
    echo -e "-----------------------------------------------------------------\n"
  fi
done
