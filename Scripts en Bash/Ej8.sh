#!/bin/bash

#script que imprima en pantalla, cada 10 segundos, los nombres de todos los usuarios que estan logueados en el sistema

while true; do
	echo "los usuarios que estan logueados son: $(who)"
	sleep 10
done