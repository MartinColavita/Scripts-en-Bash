#!/bin/bash

#script que reciba como primer parametro un directotio, 
#luego uno o mas nombres de archivos (no sabemos cuantos).debemos validar que el directorio indicado exista y que sea un directorio. 
#luego por cada nombre de archivo ingresado debemos validar que el mismo exista, y en caso de existir, 
#si es un archivo, e informar por pantalla si poseemos permiso de ejecucion sobre el mismo. y si es un directorio, 
#informar si poseemos permiso de escritura.

if [$# -le 1]; then
	echo "debe pasar al menos 2 parametros"
	exit 1
fi

if [! -D $!]; then
	exit 2
fi

array=($*)                                  #creo un arreglo con todos los argumentos
cd $1									    #me posiciono en el directorio

for ((i=1; i<${array[*]}; i++)){
	if [-f ${array[$i]}]; then                               #si es un archivo
		if [-x ${array[$i]}]; then                           #si tiene permiso de ejecucion
			echo "posee permisos de ejecucion"
		fi
	fi
	if [-D ${array[$i]}]; then                                #si es un directorio
		if[-w ${array[$i]}]; then							  #si tiene permiso de escritura
			echo "posee permisos de escritura"
		fi
	fi
done
}

