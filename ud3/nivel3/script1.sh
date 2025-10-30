#!/bin/env bash

read -p "Número 1: " x
read -p "Número 2: " y

if [[ $x -gt $y ]]; then
  echo "El primer número es mayor"
elif [[ $x -lt $y ]]; then
  echo "El segundo número es mayor"
else
  echo "Ambos números son iguales"
fi
