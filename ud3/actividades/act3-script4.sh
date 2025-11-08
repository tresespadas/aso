#!/bin/bash

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
    backup_path="/backup"
    mkdir -p $backup_path
    mkdir -p $backup_path/$user_input && tar cfvz $user_input$(date +%Y%m%d%H%M%S).tar.gz /home/$user_input &>/dev/null
    mv $user_input$(date +%Y%m%d%H%M%S).tar.gz $backup_path/$user_input
    chown -R $user_input:$user_input $backup_path
    chmod 700 -R $backup_path
  else
      exit 2
  fi
else 
  exit 1
fi
