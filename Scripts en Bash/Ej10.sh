#!/bin/bash
# script que agregue en un arreglo todos los nombres de los usuarios del sistema
#pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
#“-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso
#contrario, un mensaje de error.
#“-l”: Devuelve la longitud del arreglo
#“-i”: Imprime todos los elementos del arreglo en pantalla

users=$( cat /etc/passwd | cut -d ":" -f4 )
array=()

elemento() {
  local n=$1
  if [[ $1 -le ${#array[@]} ]]; then
    echo "El elemento en la posicion $1 es: ${array[$1]}"
    return 0
  else
    echo "La posicion ingresada no es válida."
    return 1
  fi
}

length() {
  echo "La longitud del arreglo es: ${#array[@]}"
}

print() {
  echo "Elementos del arreglo:"
  for i in ${array[@]}; do
    echo "$i"
  done
}

array=($users)
case $# in
  "1" )
    case $1 in
      "-l" )
        length
        ;;
      "-i" )
        print
        ;;
      * )
        exit 1
        ;;
    esac
    ;;
  "2" )
    echo "$2"
    if [ "$1" = "-b" ] && [ $2 > 0 ]; then
      elemento $2
    fi
    ;;
  * )
    exit 1
    ;;
esac
exit 0