#!/bin/bash

echo "Adivina el Número"
echo "Se generará un número aleatorio entre 1-100, tenés 5 intentos para adivinarlo"

numeroAleatorio=$((1 + $RANDOM % 100))
intentos=7

while [[ $intentos -gt 0 ]]; do
    echo "Ingresá un número entre 1 y 100"
    read numeroIngresado
    
    if [[ $numeroIngresado -gt $numeroAleatorio ]];
        then
            ((intentos -= 1))
            if [[ $intentos -gt 0 ]]; 
                then
                    echo "Más bajo, te quedan $intentos intentos"
            fi
    elif [[ $numeroIngresado -lt $numeroAleatorio ]];
        then
            ((intentos -= 1))
             if [[ $intentos -gt 0 ]]; 
                then
                    echo "Más alto, te quedan $intentos intentos"
            fi
    elif [[ $numeroIngresado -eq $numeroAleatorio ]];
        then
        echo "-------------------------------------------------"
            echo "Feliciationes, el número era $numeroAleatorio"
            ((intentos = 0))
    fi

    if [[ $intentos -eq 0 && $numeroIngresado -ne $numeroAleatorio ]];
        then
            echo "--------------------------------------------------------"
            echo "Te quedaste sin intentos, el numero era $numeroAleatorio"
    fi
done