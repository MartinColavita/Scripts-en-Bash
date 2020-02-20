#!/bin/bash

#script que reciba como primer parametro un directorio, luego uno o mas nombres de archivo.
#debemos validar que el directorio indicado existaluego por cada nombre de archivo ingresado debemos validar que exista en el directorio 
#ingresado como parametro, y en caso de existir, si es un archivo, renombrarlo concatenando la palabra parcial al final del nombre 
#y si es un directorio, renombrerlo concatenando la palabra dir al comienzo.

if [$# -eq 0]; then
	echo "no se recibio ningun parametro"
	exit 1
elif [[ -D $1 ]]; then									#si el primer parametro es un directorio
	
	cd $1												#me posiciono en el directorio

	for archivo in $*; do
		if [$archivo = $1]; then
			continue									#salteo el primer parametro
		else
			if [-f $archivo]; then
				mv $archivo ${archivo}parcial           #escribo al final
			elif [[ -D $archivo ]]; then
				mv $archivo dir${archivo}				
			fi
		fi
	done
fi		