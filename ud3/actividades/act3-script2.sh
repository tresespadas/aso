#!/bin/env bash

read -rp "Inserta un usuario/grupo del sistema: " user_input
comprueba_user=$(awk -F ':' -v user="$user_input" '$1 == user {print $1}' /etc/passwd)
comprueba_grupo=$(awk -F ':' -v group="$user_input" '$1 == group {print $1}' /etc/group)
if [[ -n $comprueba_user ]]; then
  geco=$(awk -F ':' -v user="$user_input" '$1 == user {print $5}' /etc/passwd)
  geco=$(echo "$geco" | sed -E s/,,,//)
	{
		echo "El UID del usuario "$user_input" es : $(awk -F ':' -v user="$user_input" '$1 == user {print $3}' /etc/passwd)"
		echo "El GID del usuario "$user_input" es : $(awk -F ':' -v user="$user_input" '$1 == user {print $4}' /etc/passwd)"
		echo "La shell del usuario "$user_input" es : $(awk -F ':' -v user="$user_input" '$1 == user {print $7}' /etc/passwd)"
		echo "El home del usuario "$user_input" es : $(awk -F ':' -v user="$user_input" '$1 == user {print $6}' /etc/passwd)"
		echo "La descripción del usuario "$user_input" es : ${geco:-"(Sin descripción)"}"
	} | tee -a "informeUsuarios_Grupos.txt" > /dev/null
fi

if [[ -n $comprueba_grupo ]]; then
  miembros_grupo=$(awk -F ':' -v group="$user_input" '$1 == group {print $4}' /etc/group)
	{
		echo "El GID del grupo "$user_input" es : $(awk -F ':' -v group="$user_input" '$1 == group {print $3}' /etc/group)"
		echo "Los miembros del grupo "$user_input" son : ${miembros_grupo:-$comprueba_grupo}"
	} | tee -a "informeUsuarios_Grupos.txt" > /dev/null
fi

if [[ -f "informeUsuarios_Grupos.txt" ]]; then
  less "informeUsuarios_Grupos.txt"
else 
  echo "No existe ni usuario ni grupo con el nombre de $user_input"
fi
