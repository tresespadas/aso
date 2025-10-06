# 1.) 
# Commonly Used `ps` Parameters (Non-BSD Style)

These options are typically used with `ps` in **UNIX standard (POSIX/GNU) format**, not the BSD style (which omits dashes).

## Most Useful `ps` Options

| Option           | Description |
|------------------|-------------|
| `-e`             | Select all processes (same as `-A`) |
| `-f`             | Full-format listing (includes PPID, UID, start time, etc.) |
| `-u <user>`      | Show processes for a specific user |
| `-U <user>`      | Select processes for real user ID `<user>` |
| `-p <pid>`       | Display information for the specified process ID(s) |
| `-A`             | Show all processes (same as `-e`) |
| `--sort=<key>`   | Sort output by the given key (e.g., `--sort=-pcpu`) |
| `--forest`       | Show process hierarchy (tree structure) |
| `--user <user>`  | Show processes belonging to the given user |
| `--pid <pid>`    | Show process with specific PID |
| `--ppid <ppid>`  | Show processes with the given parent PID |
| `--no-headers`   | Do not print the header line |
| `--format <fmt>` | Specify output format (e.g., `--format pid,cmd,%mem,%cpu`) |

## Common Output Formats

| Format Token | Description |
|--------------|-------------|
| `pid`        | Process ID |
| `ppid`       | Parent process ID |
| `uid`        | User ID |
| `user`       | Username |
| `%cpu`       | CPU usage |
| `%mem`       | Memory usage |
| `cmd`        | Command with all its arguments |
| `comm`       | Command name (without arguments) |
| `etime`      | Elapsed time since the process was started |
| `time`       | Cumulative CPU time |
| `stat`       | Process state |
| `tty`        | Controlling terminal |

# 2.)
`ps -u $USER --format stat,pid,cmd --no-header | awk 'END { print NR-1 }'`

# 3.)
`htop`
`top`

# 4.)
```bash
sleep 600 &

ps -p <pid> -o pid,cmd,ni
```

# 5.)
```bash
sleep 100 &

ps -p <pid> -o pid,cmd,ni

```

# 6.)
```bash

El renice como usuario no puedo subir la prioridad, sólo puede bajarla

```
# 7.)
```bash

renice -n 0 <pid>
```

# 8.)
`ps -o rtprio`

# 9.) 
```bash
pstree -t
pstree -p
pstree -T
```

# 10.)
`uname -a`

# 11.)
`ls -la /boot`

# 12.)
```bash

journalctl -b 0
journalctl -b 1
sudo dmesg -l warn
```

# 2.1)
`Ctrl+Z - Stopped`

# 2.2)
```bash

sleep 600 &
jobs
fg % 1

```
# 2.3) 
```bash
sleep 600 &
kill -SIGTERM <pid>
kill -SIGKILL <pid>
```

# 2.4)
`find /home -type f -exec du -h {} + | sort -hr | head -n 10 | tee ~/top_files.log`

# 2.5)
`ls -la /proc/1`

# 2.6)
Código de estado distinto de 0 - Error

# 2.7)
```bash
#!/bin/bash

pid=$(ps -p $1 --no-header)
if [ $(echo $?) -eq 1 ]; then
    echo "El proceso con el pid $1 no existe"
else
    echo "El proceso con el pid $1 SÍ existe"
    echo "Se procede a matarlo..."
    kill -SIGKILL $1
fi
```

# 2.8)
```bash
#!/bin/bash

ctrl_c()
{
    echo "Saliendo del programa..."
    exit
}

trap ctrl_c SIGINT

yes
```

# 2.9)
```bash
htop - Filter MEM
top - Shift + m
ps -u <user> -o pid,cmd,%mem --sort=-%mem
```

# 2.10)
/proc/loadavg ofrece una forma ligera y directa de saber si el sistema está sobrecargado o funcionando con normalidad.

Entender estos valores es esencial para un administrador de sistemas: pueden alertarte de cuellos de botella, procesos colgados o necesidad de optimizar recursos.

Relacionar la información de este archivo con herramientas interactivas (top, htop, uptime) o analíticas (ps, vmstat) permite una visión completa del estado del sistema.

Si la carga sube mucho pero el uso de CPU es bajo, puede indicar problemas de I/O o procesos bloqueados.

# 2.11)
```bash
Ctrl+z
kill -3 <pid>
kill -SIGQUIT <pid>
```

# 2.12)
`pkill sleep`

# 2.13)
