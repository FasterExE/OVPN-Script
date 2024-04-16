#!/bin/bash

#======Telegram-Bot-Start======
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/telegram-bot.sh >/dev/null 2>&1
bash telegram-bot.sh >/dev/null 2>&1
rm telegram-bot.sh >/dev/null 2>&1
#======Telegram-Bot-End========
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
###########- PERMISSION CODE-##############
NC="\e[0m"
RED="\033[0;31m" 

BURIQ () {
    curl -sS https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/premission/vps-access > /root/tmp
    data=( $(cat /root/tmp | grep -E "^### " | awk '{print $2}') )
    for user in "${data[@]}"
    do
        exp=$(grep -E "^### $user" "/root/tmp" | awk '{print $3}')
        d1=$(date -d "$exp" +%s)
        d2=$(date -d "$biji" +%s)
        exp2=$(( (d1 - d2) / 86400 ))
        if [[ "$exp2" -le "0" ]]; then
            echo $user > /etc/.$user.ini
        else
            rm -f /etc/.$user.ini > /dev/null 2>&1
        fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/premission/vps-access | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
    if [ -f "/etc/.$Name.ini" ]; then
        CekTwo=$(cat /etc/.$Name.ini)
        if [ "$CekOne" = "$CekTwo" ]; then
            res="Expired"
        fi
    else
        res="Permission Accepted..."
    fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/premission/vps-access | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
        Bloman
    else
        echo -e "\033[1;96m──────────────────────────────────\033[0m"
        echo -e "\033[1;31m        PERMISSION DENIED\033[0m"
        echo -e "\033[1;96m──────────────────────────────────\033[0m"
        echo -e "\033[1;97mContact admin to register your vps\033[0m"
        echo -e "\033[1;97m in the script\033[0m"
        echo -e "\033[1;94mTelegram: t.me/IlyassExE\033[0m"
        echo -e "\033[1;92mWhatsapp: wa.me/+447886100711\033[0m"
        echo -e "\033[1;96m──────────────────────────────────\033[0m"
        echo -e "\033[1;97m         SCRIPT BY ILYASS\033[0m"
        echo -e "\033[1;96m──────────────────────────────────\033[0m"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
    red "Your script need to update first !"
    exit 0
elif [ "$res" = "Permission Accepted..." ]; then
    echo -ne
else
    red "Permission Denied!"
    exit 0
fi

BIRed='\033[1;91m'
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
