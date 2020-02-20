#!/bin/bash

#script que obtenga los nombres de los usuarios del sistema de la manera mas certera posible. 
#luego para cada usuario debe verificar si en su directorio existe al menos un archivo llamado detect, si se encuentra al menos uno, 
#el script debe terminar exitosamente.caso contrario debe terminar con codigo de error 1

for i in $(cat /etc/passwd | cut -d: -f1); do
	directorio=/home/$1
	cant=$(find $directorio -name detect | wc -l)
	if [$cant -ne 0];then
		exit 0
	fi
done
exit 1
