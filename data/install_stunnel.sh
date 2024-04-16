#!/bin/bash
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
        exit 0
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

cd /etc/stunnel/ || exit

openssl genrsa -out stunnel.key 2048 > /dev/null 2>&1
(echo MA ; echo Barnousi; echo Casablanca ; echo FasterCFG ; echo FasterExE ; echo ilyass.xyz ; echo ilyassnajhi10@gmail.com )|openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt > /dev/null 2>&1
cat stunnel.crt stunnel.key > stunnel.pem
mv stunnel.pem /etc/stunnel/
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
cat <<"EOM" >/etc/stunnel/stunnel.conf
debug = 0
output = /tmp/stunnel.log
cert = /etc/stunnel/stunnel.pem
[openvpn-tcp]
connect = PORT_TCP  
accept = 443
[ssh]
connect = 22
accept = 442

EOM

sed -i "s|PORT_TCP|$PORT_TCP|g" /etc/stunnel/stunnel.conf
sed -i "s|PORT_UDP|$PORT_UDP|g" /etc/stunnel/stunnel.conf
cd /etc/default && rm stunnel4

cat <<"EOM" >/etc/stunnel/stunnel4
ENABLED=1
FILES="/etc/stunnel/*.conf"
OPTIONS=""
PPP_RESTART=0
RLIMITS=""
EOM


chmod 755 stunnel4
sudo service stunnel4 restart
