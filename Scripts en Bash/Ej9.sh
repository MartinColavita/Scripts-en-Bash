#!/bin/bash
#script que simule el comportamiento de una estructura de PILA e implemente
#las siguientes funciones aplicables sobre una estructura global definida en el script:
#push: Recibe un parámetro y lo agrega en la pila
#length: Devuelve la longitud de la pila
#pop: Saca un elemento de la pila
#print: Imprime todos elementos de la pila


stack=()
function push() {
  for (( i = 0; i < $#; i++ ))
  do
    pos=$( expr $i + 1 )
    stack[${#stack[@]}]=${*[$pos]}
  done
}

function length() {
  return ${#stack[@]}
}

function pop() {
  for (( i = 0; i < $1; i++ ))
  do
    pos=$( expr ${#stack[@]} - 1 )
    unset stack[$pos]
  done
}

function print() {
  for i in stack; do
    print "${stack[$i]}"
  done
}

select option in Push Pop Length Print; do
  case $option in
    "Push")
      read value
      push $value
      ;;
    "Pop")
      read value
      pop $value
      ;;
    "Length")
      length
      echo $?
      ;;
    "Print")
      print
      ;;
    "Exit")
      exit 0
      ;;
    *)
      exit 1
      ;;
  esac
done
