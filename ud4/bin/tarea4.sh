#!/usr/bin/env bash

logger "Tarea 4 - Ejecutada con éxito"

while IFS= read -r usuario; do
  useradd -m -s /bin/bash "$usuario"
  getent passwd "$usuario" > /home/acabello/logs/tarea4.log
done < <(cat /home/acabello/bin/lista_usuarios.dat)
