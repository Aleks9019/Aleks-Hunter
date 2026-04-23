#!/bin/bash

# Colores
VERDE="\e[32m"
AZUL="\e[34m"
ROJO="\e[31m"
AMARILLO="\e[33m"
CYAN="\e[36m"
FIN="\e[0m"

while true; do
    clear
    # AQUÍ ESTÁN LAS LETRAS GRANDES QUE FALTABAN
    echo -e "${ROJO}"
    echo "  █████╗ ██╗     ███████╗██╗  ██╗███████╗"
    echo " ██╔══██╗██║     ██╔════╝██║ ██╔╝██╔════╝"
    echo " ███████║██║     █████╗  █████╔╝ ███████╗"
    echo " ██╔══██║██║     ██╔══╝  ██╔═██╗ ╚════██║"
    echo " ██║  ██║███████╗███████╗██║  ██╗███████║"
    echo " ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝"
    echo -e "${CYAN}"
    echo " ██╗  ██╗██╗   ██╗███╗   ██╗████████╗███████╗██████╗ "
    echo " ██║  ██║██║   ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗"
    echo " ███████║██║   ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝"
    echo " ██╔══██║██║   ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗"
    echo " ██║  ██║╚██████╔╝██║ ╚████║   ██║   ███████╗██║  ██║"
    echo " ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝"
    echo -e "${FIN}"
    echo -e "           ${AMARILLO}v2.0 - Coded by Aleks9019${FIN}"
    echo "--------------------------------------------------------"
    echo -e "${AMARILLO} 0)${FIN} INSTALAR/ACTUALIZAR DEPENDENCIAS"
    echo -e "${AMARILLO} 1)${FIN} RASTREO DE IP (Nmap)"
    echo -e "${AMARILLO} 2)${FIN} BUSCAR REDES SOCIALES (Sherlock/Holehe)"
    echo -e "${AMARILLO} 3)${FIN} CAMBIAR DIRECCIÓN MAC"
    echo -e "${AMARILLO} 4)${FIN} SALIR"
    echo "--------------------------------------------------------"
    read -p "Selecciona una opción: " OPCION

    case $OPCION in
        0)
            echo -e "\n${VERDE}[+] Instalando dependencias necesarias...${FIN}"
            sudo apt update && sudo apt install -y nmap tor macchanger curl python3-pip git
            python3 -m pip install holehe
            echo -e "${VERDE}[+] Proceso completado.${FIN}"
            read -p "Presiona Enter para volver..."
            ;;
        1)
            if ! command -v nmap &> /dev/null; then
                echo -e "${ROJO}[!] Nmap no está instalado. Usa la opción 0.${FIN}"
            else
                read -p "Introduce la IP a rastrear: " IP
                nmap -F $IP
            fi
            read -p "Presiona Enter para volver..."
            ;;
        2)
            echo -e "\n${AZUL}1. Buscar por Email (Holehe)${FIN}"
            echo -e "${AZUL}2. Buscar por Usuario (Sherlock)${FIN}"
            read -p "Selección: " SUB
            if [ "$SUB" == "1" ]; then
                read -p "Email: " MAIL
                holehe $MAIL
            else
                echo -e "${ROJO}[!] Asegúrate de tener Sherlock en la misma carpeta.${FIN}"
            fi
            read -p "Presiona Enter para volver..."
            ;;
        3)
            sudo macchanger -s eth0
            read -p "Presiona Enter para volver..."
            ;;
        4)
            echo "Apagando el sistema Hunter..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            sleep 2
            ;;
    esac
done
