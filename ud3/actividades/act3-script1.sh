#!/bin/env bash

info_cpu()
{
	cat /proc/cpuinfo
}

info_mem()
{
	cat /proc/meminfo
}

info_disco()
{
	free -h
}

info_part()
{
	lsblk -f
}

info_sist_arch()
{
	cat /proc/mounts
}

info_load_avg()
{
	cat /proc/loadavg
}

{
	fecha_actual=$(date +%d-%m-%y-%H:%M:%S)
	echo "## SCRIPT CREADO EN LA FECHA $fecha_actual ##"
	echo "-- Información de la CPU --"
	info_cpu
	echo
	echo "-- Información de la Memoria --"
	info_mem
	echo
	echo "-- Información del Disco --"
	info_disco
	echo
	echo "-- Información de las Particiones --"
	info_part
	echo
	echo "-- Información de los sistemas de archivos --"
	info_sist_arch
	echo
	echo "-- Información de la carga en el sistema --"
	info_load_avg
	echo
	echo "-- Información sobre los usuarios logueados --"
	who -q
	echo
} | sudo tee "informe.txt" > /dev/null
cat "informe.txt" | less
