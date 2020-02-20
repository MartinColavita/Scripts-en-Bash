#!/bin/bash

#script que verifica cada 5 segundos si un usuario esta logeado al sistema. 
#el nombre de usuario es pasado como parametro. En caso de que se detecte que el usuario esta logeado, se debera informar: 
#" el usuario X es usuario del sistema", guardar en un archivo llamado usuarios.log el nombre del usuario y la fecha y terminar el script. 
#tenga en cuenta que la informacion del archivo No debe pisarse, y que el archivo resultante lo debe almacenar en una ubicacion apropiada.

if [$# -ne 1]; then
	echo " no es la cantidad de parametros esperada"
	exit 1
else
	while true; do
		if [$(who | grep $1 | wc -l) -gt 0]; then
			echo "el usuario $1 es usuario del sistema"
			echo " $1 $(date)  " >> /var/log/usuarios.log
			exit 0
		fi 
		sleep 5
	done
fi