#!/bin/bash

archivo_salida="informeUsuarios_Grupos.txt"

if getent passwd acabello >/dev/null; then
  usuario_info=$(getent passwd acabello)
  IFS=: read -r usuario password uid gid geco home shell <<<"$usuario_info"

  grupo_primario_info=$(getent group "$gid")
  IFS=: read -r grupo gpassword guid miembros <<<"$grupo_primario_info"

  cat >"$archivo_salida" <<EOF
Usuario: $usuario
UID: $uid
GID: $gid
Home: $home
Shell: $shell

Grupo: $grupo
GUID: $guid
Miembros: ${miembros:-Ninguno}
EOF
fi
