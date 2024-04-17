#!/bin/bash

ORANGE='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
clear
rm setup1.sh > /dev/null 2>&1
rm setup2.sh > /dev/null 2>&1
echo -e "${ORANGE}"
echo " ██████╗ ██████╗ ███████╗███╗   ██╗    ██╗   ██╗██████╗ ███╗   ██╗"
echo "██╔═══██╗██╔══██╗██╔════╝████╗  ██║    ██║   ██║██╔══██╗████╗  ██║"
echo "██║   ██║██████╔╝█████╗  ██╔██╗ ██║    ██║   ██║██████╔╝██╔██╗ ██║"
echo "██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║    ╚██╗ ██╔╝██╔═══╝ ██║╚██╗██║"
echo "╚██████╔╝██║     ███████╗██║ ╚████║     ╚████╔╝ ██║     ██║ ╚████║"
echo " ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝      ╚═══╝  ╚═╝     ╚═╝  ╚═══╝"
echo -e "${NC}"

display_options() {
    echo -e "${CYAN}Please choose the operation to perform:${NC}"
    echo -e "${GREEN}1${NC}) ${BLUE}Install OpenVPN Classic${NC}"
    echo -e "${GREEN}2${NC}) ${BLUE}Install OpenVPN V3${NC}"
    echo -e "${RED}x${NC}) ${RED}Exit${NC}"
}

display_options

while true; do
    echo -n -e "${ORANGE}Enter the number of the command (or 'x' to exit): ${NC}"
    read choice

    case $choice in
        1)
            echo -e "${ORANGE}Installing OpenVPN Classic...${NC}"
            clear
            wget https://raw.githubusercontent.com/FasterExE/OVPN-Script-Classic/main/setup1.sh > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                bash setup1.sh
                rm setup1.sh > /dev/null 2>&1
            else
                echo -e "${RED}Download failed.${NC}"
            fi
            ;;
        2)
            echo -e "${ORANGE}Installing OpenVPN V3...${NC}"
            clear
            wget https://raw.githubusercontent.com/FasterExE/OVPN-Script-V3/main/setup2.sh > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                bash setup2.sh
                rm setup2.sh > /dev/null 2>&1
            else
                echo -e "${RED}Download failed.${NC}"
            fi
            ;;
        x|X)
            echo -e "${ORANGE}Exiting...${NC}"
            break
            ;;
        *)
            echo -e "${RED}Invalid choice. Please select a valid option.${NC}"
            display_options
            ;;
    esac
done

