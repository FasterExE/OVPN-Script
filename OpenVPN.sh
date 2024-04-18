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
sleep 2
rm setup.sh > /dev/null 2>&1; wget https://raw.githubusercontent.com/FasterExE/OVPN-Script-V3/main/setup.sh; bash setup.sh
rm setup.sh > /dev/null 2>&1
rm OpenVPN.sh > /dev/null 2>&1
