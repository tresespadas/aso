#!/usr/bin/sh

logger "Tarea 2 - Ejecutada con éxito"
who | awk '{print $1}' > /home/acabello/logs/tarea2.log
