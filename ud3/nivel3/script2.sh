#!/bin/env bash

if [[ $(echo $UID) -ne 0 ]]; then
  echo "No eres root. Este script sólo puede ser ejecutado por root"
  exit 1
fi

echo "Hola, root ;)"

