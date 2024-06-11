#!/bin/bash

echo "Mostrar genero nombre ingresado por usuario"

echo "Por favor ingrese el nombre del que quiere saber el género"
read nombreIngresado

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