#!/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Necesito dos parámetros"
  exit 1
fi

if [[ $1 -lt $2 ]]; then
  echo "$2 es mayor que $1"
elif [[ $1 -gt $2 ]]; then
  echo "$1 es mayor que $2"
else
  echo "Ambos números son iguales"
fi
