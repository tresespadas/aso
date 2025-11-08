#!/bin/bash
# Magia negra para que funcione el !(backup)
shopt -s extglob

# Realizar un script de bash que siendo ejecutado por el root, pueda recibir el nombre de un usuario registrado en el sistema. Este script creará en el directorio de trabajo de ese usuario (siempre que exista) un directorio de nombre backup. El directorio deberá pertenecer al usuario y a su grupo principal. Solo el propietario tendrá permisos de lectura, escritura y ejecución. En ese directorio se deberán copiar todos los ficheros y directorios que existan en ese momento en el directorio de trabajo del usuario, dentro de un directorio de nombreAAMMDDHHMMSS, donde AA es el año, MM mes, DD día, HH hora, MM minuto y SS segundos. 

comprueba_usuario()
{
  if id "$1" > /dev/null 2>&1; then
    return 0
  else
      return 1
  fi
}

if [[ $UID -eq 0 ]]; then
  read -rp "Usuario: " user_input
  if comprueba_usuario "$user_input"; then
    backup_path="/home/$user_input/backup"
    mkdir -p $backup_path
    mkdir -p $backup_path/$user_input$(date +%Y%m%d%H%M%S) && cp -r /home/$user_input/!(backup) $backup_path/$user_input$(date +%Y%m%d%H%M%S) 2>/dev/null
    chown -R $user_input:$user_input $backup_path
    chmod 700 -R $backup_path
  else
      exit 2
  fi
else 
  exit 1
fi
