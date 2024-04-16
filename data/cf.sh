#!/bin/bash
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

BIRed='\033[1;91m'
BIGreen='\033[1;92m'
BIYellow='\033[1;93m'
BIBlue='\033[1;94m'
BIPurple='\033[1;95m'
BIPurple='\033[1;96m'
BIWhite='\033[1;97m'
UWhite='\033[4;37m'
On_IPurple='\033[0;105m'
On_IRed='\033[0;101m'
IBlack='\033[0;90m'
IRed='\033[0;91m'
IGreen='\033[0;92m'
IYellow='\033[0;93m'
IBlue='\033[0;94m'
IPurple='\033[0;95m'
ICyan='\033[0;96m'
IWhite='\033[0;97m'
NC='\e[0m'

tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"


export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
clear
echo -e "${BIPurple} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BIPurple} │                  ${BIWhite}${UWhite}ILYASS  OVPN-SCRIPT${NC}"
echo -e "${BIPurple} │"
echo -e "${BIPurple} │  ${BIPurple}IP        :  ${BIYellow}$(curl -sS ifconfig.me)${NC}"
echo -e "${BIPurple} │  ${BIPurple}DOMAIN    :  ${BIYellow}$(cat /etc/domain/d-domain)${NC}"
echo -e "${BIPurple} │  ${BIPurple}FLARE     :  ${BIYellow}$(cat /etc/domain/f-domain)${NC}"
echo -e "${BIPurple} │  ${BIPurple}OS        :  ${BIYellow}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )${NC}"
echo -e "${BIPurple} │  ${BIPurple}CPU       :  ${BIYellow}$cpu_usage${NC}"
echo -e "${BIPurple} │  ${BIPurple}RAM       :  ${BIYellow}$totalram MB${NC}"
echo -e "${BIPurple} │  ${BIPurple}SWAP RAM  :  ${BIYellow}$uram / $tram MB${NC}"
echo -e "${BIPurple} └─────────────────────────────────────────────────────┘${NC}"
echo -e "${BIPurple} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BIPurple} │  ${BIPurple}[${BIWhite}01${BIPurple}] ADD USER    ${BIPurple}[${BIYellow}Menu${BIPurple}]${NC}"  "${BIPurple}  [${BIWhite}03${BIPurple}] USER ON    ${BIPurple}[${BIYellow}Menu${BIPurple}]${NC}" "${BIPurple}  │${NC}"
echo -e "${BIPurple} │  ${BIPurple}[${BIWhite}02${BIPurple}] DEL USER    ${BIPurple}[${BIYellow}Menu${BIPurple}]${NC}"  "${BIPurple} ${BIWhite}  ${BIPurple}                ${BIPurple} ${BIYellow}    ${BIPurple} ${NC}" "${BIPurple} │${NC}"
echo -e "${BIPurple} └─────────────────────────────────────────────────────┘${NC}"
echo
read -p " >>>>   " opt
echo -e ""
case $opt in
1) clear ; add-user ;;
2) clear ; del-user ;;
3) clear ; on-user ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; exit ;;
esac

#random
apt install jq curl -y
rm -rf /etc/domain/d-domain
rm -rf /etc/domain/f-domain
mkdir -p /etc/domain
touch /etc/domain/d-domain
touch /etc/domain/f-domain
clear
sub=$(</dev/urandom tr -dc a-z0-9 | head -c5)
DOMAIN=ilyass.my.id
WS_DOMAIN=ws-${sub}.ovpn.ilyass.my.id
FLARE_DOMAIN=flare-${sub}.ovpn.ilyass.my.id
NS_DOMAIN=ns-${sub}.ilyass.my.id
CF_ID=ilyassnajhi10@gmail.com
CF_KEY=c802b86ce41793d4aed457ad769889b7e31e9
set -euo pipefail
IP=$(curl -sS ifconfig.me);
echo "Updating DNS for ${WS_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${WS_DOMAIN}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
#start-ws
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${WS_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
#end-ws
echo "Updating DNS FLARE for ${FLARE_DOMAIN}..."
#start-flare
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"CNAME","name":"'${FLARE_DOMAIN}'","content":"'${WS_DOMAIN}'","ttl":120,"proxied":true}' | jq -r .result.id)
#end-flare

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${WS_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "Updating DNS NS for ${NS_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then

#start-ns
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${WS_DOMAIN}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
#end-ns

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${WS_DOMAIN}'","ttl":120,"proxied":false}')
echo "Host WS : $WS_DOMAIN"
echo "Host FLARE: $FLARE_DOMAIN"
echo "Host NS : $NS_DOMAIN"
echo -e "Done Record Domain= $WS_DOMAIN"
echo -e "Done Record Flare Domain= $FLARE_DOMAIN"
echo -e "Done Record NSDomain= $NS_DOMAIN"
echo "$WS_DOMAIN" > /etc/domain/d-domain
echo "$FLARE_DOMAIN" >/etc/domain/f-domain 
rm -rf cf
sleep 1
