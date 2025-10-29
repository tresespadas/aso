#!/bin/env bash

if [ $# -lt 1 ]; then
  echo "Necesito parámetros"
  exit 1
else
  for i in $@; do
    echo $i
  done
fi
