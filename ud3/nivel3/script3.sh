#!/bin/env bash

function sumar()
{
  read -p "Número 1: " x
  read -p "Número 2: " y
  echo $(($x+$y))
}

function restar()
{
  read -p "Número 1: " x
  read -p "Número 2: " y
  echo $(($x-$y))
}

function dividir()
{
  read -p "Número 1: " x
  read -p "Número 2: " y
  echo $(($x/$y))
}

function multiplicar()
{
  read -p "Número 1: " x
  read -p "Número 2: " y
  echo $(($x*$y))
}

function salir()
{
  echo -e "\nSaliendo..."
  exit 0
}

while true; do
  echo "1.- Sumar"
  echo "2.- Restar"
  echo "3.- Dividir"
  echo "4.- Multiplicar"
  echo "0.- Salir"

  read -p "Opción: " opt

  case "$opt" in
    1)
      sumar;
      ;;
    2)
      restar;
      ;;
    3)
      dividir;
      ;;
    4)
      multiplicar;
      ;;
    0)
      salir;
      ;;
    ?) echo -e "Opción errónea\n"; continue;;
  esac
done
