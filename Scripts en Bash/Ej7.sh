#!/bin/bash

#script que verifique cada 5 segundos si el proceso apache se esta ejecutando en el sistema,
#hasta que verifique que en 10 ocaciones a econtrado el proceso apache corriendo. 
#lo cual debe terminar el proceso, informar dicha accion en pantall y terminar terminar el script con condicion 50.

contador=0

while [$contador -lt 10]; do
	esta=$(ps -aux | grep apache | wc -l)
	if [$esta - ne 0]; then
		let contador ++
	fi
	sleep 5
done

if [$contador -eq 10]; then
	echo "terminar proceso apache, se alcanzo a 10 verificaciones"
	killall apache
	exit 50
fi
