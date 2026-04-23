#!/bin/bash

# --- COLORES ---
R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
B='\033[0;34m'
C='\033[0;36m'
NC='\033[0m'

clear

menu() {
    echo -e "${R}"
    echo "  ▄▄▄▄▄  ▄      ▄▄▄▄▄  ▄  ▄▄▄     ▄   ▄  ▄   ▄  ▄   ▄  ▄▄▄▄▄  ▄▄▄▄  "
    echo "  █   █  █      █      █ █        █   █  █   █  █▄  █    █    █   █ "
    echo "  █▄▄▄█  █      █▄▄▄   ██         █▄▄▄█  █   █  █ █ █    █    █▄▄▄▀ "
    echo "  █   █  █      █      █ █        █   █  █   █  █  ██    █    █  ▀▄ "
    echo "  █   █  █▄▄▄▄  █▄▄▄▄  █  █▄▄     █   █  ▀▄▄▄▀  █   █    █    █   █ "
    echo -e "                            [ Versión 2.0 - Suite Blindada ]${NC}"
    echo -e "                 ${C}Desarrollado por: Aleks 9019${NC}\n"
    
    IP=$(hostname -I | awk '{print $1}')
    echo -e "${Y}IP LOCAL:${NC} $IP  |  ${R}ESTADO:${NC} Hunter Activo"
    echo -e "--------------------------------------------------------------------------"
    echo -e "${G}1)${NC} MODO FANTASMA (MAC)   ${G}6)${NC} NAVEGADOR TOR"
    echo -e "${G}2)${NC} TEST CONEXIÓN         ${G}7)${NC} LIMPIEZA TOTAL"
    echo -e "${G}3)${NC} RASTREO CORREO        ${G}8)${NC} RADAR NMAP"
    echo -e "${G}4)${NC} RASTREO USUARIO       ${G}9)${NC} EXIFTOOL (FOTOS)"
    echo -e "${G}5)${NC} GEOLOCALIZAR IP       ${R}10) SALIR${NC}"
    echo -e "--------------------------------------------------------------------------"
    read -p "Selecciona una herramienta, Hunter: " op
}

while true; do
    menu
    case $op in
        1) sudo ifconfig eth0 down && sudo macchanger -r eth0 && sudo ifconfig eth0 up ;;
        2) proxychains curl -s https://ifconfig.me ;;
        3) read -p "Email: " em && proxychains holehe $em ;;
        4) read -p "User: " us && proxychains sherlock $us ;;
        5) read -p "IP: " ip && curl -s https://ipapi.co/$ip/json/ ;;
        6) proxychains firefox --private-window https://check.torproject.org & ;;
        7) history -c && rm -rf ~/.cache/mozilla/firefox/* && echo -e "${G}Limpio${NC}" ;;
        8) read -p "IP/Host: " h && nmap -F --open $h ;;
        9) read -e -p "Ruta: " r && exiftool "$r" ;;
        10) echo -e "\n${R}Buena caza, Aleks 9019.${NC}" && exit 0 ;;
        *) echo "Opción inválida" ;;
    esac
    echo -e "\n"
    read -p "Presiona Enter para volver al menú..."
    clear
done
