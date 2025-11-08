#!/bin/env bash

check_servicio()
{
  echo -e "--- Comprobando la existencia del servicio "$1" ---\n"
  if (systemctl list-unit-files --type=service | grep -q "$1"); then
    return 0
  else
    return 1
  fi
}

clear
while true; do
  echo "1) Comprueba el estado de un servicio"
  echo "2) Para un servicio"
  echo "3) Restaura un servicio"
  echo "4) Salir"
  read -rp "Opción: " opt

  case "$opt" in
    1)
      read -rp "Servicio: " servicio_input
      if check_servicio $servicio_input; then
        systemctl status $servicio_input
      else
        echo "El servicio no existe o no se encuentra en el sistema"
        exit 1
      fi
      ;;
    2)
      read -rp "Servicio: " servicio_input
      if check_servicio $servicio_input; then
        systemctl stop $servicio_input
        if [[ $? -eq 0 ]]; then
          echo "Servicio "$servicio_input" parado exitosamente"
        else
          echo "No se pudo parar el servicio "$servicio_input""
        fi
      else
        echo "El servicio no existe o no se encuentra en el sistema"
        exit 1
      fi
      ;;
    3)
      read -rp "Servicio: " servicio_input
      if check_servicio $servicio_input; then
        systemctl restart $servicio_input
        if [[ $? -eq 0 ]]; then
          echo "Servicio "$servicio_input" reiniciado exitosamente"
        else
          echo "No se pudo reiniciar el servicio "$servicio_input""
        fi
      else
        echo "El servicio no existe o no se encuentra en el sistema"
        exit 1
      fi
      ;;
    4)
      echo "Saliendo..."; exit 0
      ;;
  esac
done
