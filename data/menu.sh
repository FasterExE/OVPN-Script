#!/bin/bash
BIBlue='\033[1;94m'
BIPurple='\033[1;95m'
BIPurple='\033[1;96m'
BIWhite='\033[1;97m'
UWhite='\033[4;37m'
BIYellow='\033[1;93m'
IBlue='\033[0;94m'
IPurple='\033[0;95m'
IWhite='\033[0;97m'
NC='\e[0m'
clear
echo -e "${BIPurple} ┌─────────────────────────────────────────────┐${NC}"
echo -e "${BIPurple} │             ${BIWhite}${UWhite}ILYASS  OVPN-SCRIPT${NC}"
echo -e "${BIPurple} │"
echo -e "${BIPurple} │  ${BIPurple}DOMAIN    :  ${BIYellow}$(cat /etc/domain/d-domain)${NC}"
echo -e "${BIPurple} │  ${BIPurple}IP        :  ${BIYellow}$(hostname -I | awk '{print $1}')${NC}"
echo -e "${BIPurple} │  ${BIPurple}FLARE     :  ${BIYellow}$(cat /etc/domain/f-domain)${NC}"
echo -e "${BIPurple} │"
echo -e "${BIPurple} │  ${BIPurple}[${BIWhite}01${BIPurple}] ADD USER     ${BIPurple}${NC}"  "${BIPurple}    [${BIWhite}02${BIPurple}] DELETE USER       ${NC}"
echo -e "${BIPurple} └─────────────────────────────────────────────┘${NC}"
DATE=$(date +'%d %B %Y')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "        ${BIPurple}│$NC Expiry In     : $(( (d1 - d2) / 86400 )) Days $NC"
}
mai="datediff "$Exp" "$DATE""
echo
read -p " >>>>   " opt
echo -e ""
case $opt in
1) clear ; add-user ;;
2) clear ; del-user ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; exit ;;
esac