#!/bin/env bash

if [ $# -lt 2 ]; then
  echo "Necesito dosparámetros"
  exit 1
else
  echo "Suma: $(($1+$2))"
  echo "Resta: $(($1-$2))"
  echo "Multiplicación: $(($1*$2))"
  echo "División: $(($1/$2))"
fi
