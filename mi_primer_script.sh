#!/bin/bash

# Colores
VERDE="\e[32m"
CYAN="\e[36m"
ROJO="\e[31m"
AMARILLO="\e[33m"
GRIS="\e[90m"
FIN="\e[0m"

# Bucle infinito para que el script no se cierre solo
while true; do
    clear
    # --- BANNER SÓLIDO (ALEKS HUNTER) ---
    echo -e "${ROJO}"
    echo " █████  ██      ███████ ██   ██ ███████ "
    echo "██   ██ ██      ██      ██  ██  ██      "
    echo "███████ ██      █████   █████   ███████ "
    echo "██   ██ ██      ██      ██  ██       ██ "
    echo "██   ██ ███████ ███████ ██   ██ ███████ "
    echo -e "${CYAN}"
    echo "██   ██ ██   ██ ███    ██ ████████ ███████ ██████  "
    echo "██   ██ ██   ██ ████   ██    ██    ██      ██   ██ "
    echo "███████ ██   ██ ██ ██  ██    ██    █████   ██████  "
    echo "██   ██ ██   ██ ██  ██ ██    ██    ██      ██   ██ "
    echo "██   ██  █████  ██   ████    ██    ███████ ██   ██ "

    # --- BARRA DE ESTADO ---
    echo -e "${GRIS}------------------------------------------------------------"
    echo -ne "${VERDE}[+] USUARIO: ${FIN}$(whoami)  "
    echo -ne "${VERDE}[+] IP: ${FIN}$(hostname -I | awk '{print $1}')  "
    echo -e "${VERDE}[+] TOR: ${FIN}$(systemctl is-active tor)"
    echo -e "${GRIS}------------------------------------------------------------${FIN}"

    echo -e "${VERDE}1)${FIN} MODO FANTASMA (MAC + TOR)"
    echo -e "${VERDE}2)${FIN} VERIFICAR ANONIMATO (IP)"
    echo -e "${VERDE}3)${FIN} CAZA DE CUENTAS (Email)"
    echo -e "${VERDE}4)${FIN} CAZA DE REDES (Username)"
    echo -e "${VERDE}5)${FIN} RASTREO GPS (IP/Web)"
    echo -e "${VERDE}6)${FIN} ESCANEO SIGILOSO (Nmap + Tor)"
    echo -e "${AMARILLO}7)${FIN} LIMPIAR HUELLAS (Deep Clean)"
    echo -e "${ROJO}8) SALIR${FIN}"
    echo -e "${CYAN}============================================================${FIN}"
    echo -n "Selecciona tu herramienta, Hunter: "
    read OPCION

    case $OPCION in
        1)
            echo -e "\n${VERDE}[+] Activando protocolos...${FIN}"
            sudo systemctl start tor
            IFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
            sudo ip link set $IFACE down && sudo macchanger -r $IFACE && sudo ip link set $IFACE up
            echo -e "${VERDE}¡Invisibilidad activa!${FIN}"
            read -p "Presiona Enter para volver al menú..."
            ;;
        2)
            echo -e "\n${CYAN}[+] Tu IP pública actual (Vía Tor):${FIN}"
            proxychains4 curl -s https://ifconfig.me
            echo -e "\n"
            read -p "Presiona Enter para volver al menú..."
            ;;
        3)
            echo -n "Introduce el correo: "
            read CORREO
            proxychains4 holehe $CORREO
            read -p "Presiona Enter para volver al menú..."
            ;;
        4)
            echo -n "Introduce el usuario: "
            read USER
            proxychains4 sherlock $USER --print-found
            read -p "Presiona Enter para volver al menú..."
            ;;
        5)
            echo -n "Introduce IP/Web: "
            read OBJETIVO_IP
            proxychains4 curl -s http://ip-api.com/line/$OBJETIVO_IP
            read -p "Presiona Enter para volver al menú..."
            ;;
        6)
            echo -e "\n${AMARILLO}[!] Escaneando puertos de forma anónima...${FIN}"
            echo -n "Objetivo: "
            read SCAN_IP
            proxychains4 nmap -sT -PN -n -F $SCAN_IP
            read -p "Presiona Enter para volver al menú..."
            ;;
        7)
            echo -e "\n${ROJO}[!] Purgando logs de la VM...${FIN}"
            sudo rm -rf /var/log/auth.log /var/log/syslog 2>/dev/null
            history -c
            echo "Operación limpia."
            sleep 2
            ;;
        8)
            echo "Cerrando sistema, Hunter fuera..."
            exit 0
            ;;
        *)
            echo -e "${ROJO}Opción no válida.${FIN}"
            sleep 2
            ;;
    esac
done
