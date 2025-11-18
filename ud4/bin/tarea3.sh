#!/usr/bin/env bash
shopt -s extglob

logger "Tarea 3 - Ejecutada con éxito"
mkdir -p /home/acabello/backup
tar cfvz backup_$(date +%Y%m%d_%H%M).tar.gz /home/acabello/ 1>/home/acabello/logs/tarea3.log 2>/dev/null
mv backup_$(date +%Y%m%d_%H%M).tar.gz /home/acabello/backup
echo "Copia de seguridad realizada con éxito" >> /home/acabello/logs/tarea3.log
