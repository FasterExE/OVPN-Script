#!/bin/bash
LIGHT_YELLOW='\033[1;33m'
DARK_ORANGE='\033[0;31m'
DARK_BLUE='\033[0;34m'
NO_COLOR='\033[0m'
clear
echo -e "\033[1;36m──────────────────────────────────────────────────────────\033[0m"
echo -e "\e[38;5;208m        _______ __   __   __ ______ _______ _______
       /__  __// /  / /  / // __  // _____// _____/
        / /   / /  / /__/ // /_/ // /____ / /____
       / /   / /  /__  __// __  //____  //____  /
    __/ /__ / /____ / /  / / / /_____/ /_____/ /
   /______//______//_/  /_/ /_//______//______/\e[0m"
echo -e "\e[38;5;208m\e[0m"
echo -e "\e[38;5;208m      OpenVPN script installer by \e[34m𓆩 𝐈𝐋𝐘𝐀𝐒𝐒 𓆪 \e[0m"
echo -e "\e[38;5;208m      GitHub: \e[32mhttps://github.com/FasterExE\e[0m"
echo -e "\e[38;5;208m      Telegram: \e[32mhttps://t.me/IlyassExE\e[0m"
echo -e "\033[1;36m──────────────────────────────────────────────────────────\033[0m"
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}1${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL REQUIRE${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_require.sh >/dev/null 2>&1
bash install_require.sh >/dev/null 2>&1
rm install_require.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}2${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL APACHE${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_apache2.sh >/dev/null 2>&1
bash install_apache2.sh >/dev/null 2>&1
rm install_apache2.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}3${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL SOCKS${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_socks.sh >/dev/null 2>&1
bash install_socks.sh >/dev/null 2>&1
rm install_socks.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}4${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL DOMAIN${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_domain.sh >/dev/null 2>&1
bash install_domain.sh >/dev/null 2>&1
rm install_domain.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}5${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL MENU${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_menu.sh >/dev/null 2>&1
bash install_menu.sh >/dev/null 2>&1
rm install_menu.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}6${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL OPENVPN${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_openvpn.sh >/dev/null 2>&1
bash install_openvpn.sh >/dev/null 2>&1
rm install_openvpn.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}7${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL STUNNEL${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_stunnel.sh >/dev/null 2>&1
bash install_stunnel.sh >/dev/null 2>&1
rm install_stunnel.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}8${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL BBR${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_BBR.sh >/dev/null 2>&1
bash install_BBR.sh >/dev/null 2>&1
rm install_BBR.sh >/dev/null 2>&1
echo -e "${DARK_ORANGE}                 [${NO_COLOR}${DARK_BLUE}9${DARK_ORANGE}]${NO_COLOR} ${LIGHT_YELLOW}INSTALL FIREWALL KVM${NO_COLOR}"
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_firewall_kvm.sh >/dev/null 2>&1
bash install_firewall_kvm.sh >/dev/null 2>&1
rm install_firewall_kvm.sh >/dev/null 2>&1
echo -e "\033[1;36m──────────────────────────────────────────────────────────\033[0m"
sleep 6
clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/finish.sh
bash finish.sh
