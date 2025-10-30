#!/bin/env bash

function mostrar_proceso()
{
  ps -u $USER --format pid,ppid,stat,ni,%cpu,%mem,cmd,time
}

function modificar_prio()
{
  read -p "Indica el PID del proceso del que quieres modificar la prioridad: " pid
  match=$(ps -p $pid --no-header)
  if [[ -z $match ]]; then
    echo "El proceso con PID '$pid' no se encuentra en el sistema"
    return
  else
    renice -n 10 $pid
  fi
}

function eliminar_proceso()
{
  read -p "Indica el PID del proceso del que quieres eliminar: " pid
  match=$(ps -p $pid --no-header)
  if [[ -z $match ]]; then
    echo "El proceso con PID '$pid' no se encuentra en el sistema"
    return
  else
    kill -9 $pid # He estado haciendo pruebas con "sleep 50 & disown" para que no salga el stdout del kill al final del script
    if [[ $? -eq 0 ]]; then
      echo "El proceso '$pid' ha sido eliminado correctamente"
    else
      echo "NO se pudo eliminar el proceso '$pid'"
    fi
  fi
}

function salir()
{
  echo -e "\nSaliendo..."
  exit 0
}

while true; do
  echo -e "\nA.- Mostrar procesos de usuario"
  echo "B.- Modificar la prioridad de un proceso"
  echo "C.- Eliminar un proceso"
  echo -e "D.- Salir\n"

  read -p "Opción: " opt

  case "$opt" in
    [aA])
      mostrar_proceso;
      ;;
    [bB])
      modificar_prio;
      ;;
    [cC])
      eliminar_proceso;
      ;;
    [dD])
      salir;
      ;;
    ?) echo -e "Opción errónea\n"; continue;;
  esac
done
