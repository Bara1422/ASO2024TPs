#!/bin/bash
echo "Mostrar genero nombre ingresado por usuario"
echo "Para correr este script primero hay que tener instalado jq"
echo "Queres instalarlo?"
read respuesta
while [[ $respuesta != "s" && $respuesta != "S" && $respuesta != "n" && $respuesta != "N" ]];
    do
    case $respuesta in 
        "S"|"s")
        echo "Se va a instalar jq"
        sudo apt install jq
    ;;
        "N"|"n")
        echo "No se va a instalar jq"
    ;;
        *)
        echo "Por favor escriba s/n"
        read respuesta
    ;;
        esac
done

echo "Por favor ingrese el nombre del que quiere saber el género"
read nombreIngresado
while [[ $nombreIngresado == "" ]];
    do
    echo "Por favor ingrese un nombre valido"
    read nombreIngresado
done

API="https://api.genderize.io/?name=$nombreIngresado"

respuesta=`curl -s "$API" |  jq -r '.gender'`

if [[ $respuesta = "male" ]];
    then
        echo "El genero del nombre $nombreIngresado es HOMBRE"
elif [[ $respuesta = "female" ]];
    then
        echo "El genero del nombre $nombreIngresado es MUJER"
else
    echo "No hay datos suficientes para determinar el genero del nombre $nombreIngresado"
fi