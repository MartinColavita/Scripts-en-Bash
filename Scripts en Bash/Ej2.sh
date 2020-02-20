#!/bin/bash

#script que recibe una cantidad indefinida de parametros (al menos uno) y los agrega a un arreglo. ademas debe implementar las 
#siguientes funciones:
# -existe <parametro1>: imprime el indice dentro del arreglo donde esta el parametro <parametro1>, solo si este existe en el arreglo. adicionalmente, debe retornar 0 si el elemento existe en el arreglo o 1 en caso contrario.
# -replace <paeametro1><parametro2>: reemplazar <parametro1> por <parametro2> en el arreglo (solo si <parametro1> existe)
# -eliminar <parametro1>: si el parametro pasado como parametro existe en el arreglo, lo elimina del mismo. caso contrario, retorna codigo de error2
# -cantidad: imprime la cantidad total de elementos en el arreglo.
# -todos: imprime todos los elementos del arreglo

array =($*)

function existe (){
	for ((i=0; i<${#array[*]; i++})){
		if [array[$i] = $1]; then
			echo "$1"
			return 0
		fi
	done	
	return 1	
	}
}

function reemplace() {
	pos=$(existe $1)
	if [$? -eq 0]; then       
		array[$pos]=$2
		return 0
	fi	
}

function eliminar(){
	pos=$(existe $1)
	if [$? -eq 0]; then       
		unset array[$pos]
		return 0
	fi
}

function cantida (){
	echo ${#array[*]}
}

function todos () {
	echo ${array[*]}
}


