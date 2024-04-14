#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'
IP=$(hostname -I | awk '{print $1}')
domain=`cat /etc/domain/d-domain`
flare=`cat /etc/domain/f-domain`

clear
echo -e "\033[1;96m──────────────────────────────────\033[0m"
echo -e "\033[1;97m         SCRIPT BY ILYASS\033[0m"
echo -e "\033[1;96m──────────────────────────────────\033[0m"
echo -e "\033[1;97mIP               : $IP\033[0m"
echo -e "\033[1;97mHost             : $domain\033[0m"
echo -e "\033[1;97mCloudflare       : $flare\033[0m"
echo -e "\033[1;97mPort OVPN TCP    : 1194\033[0m"
echo -e "\033[1;97mPort OVPN UDP    : 2200\033[0m"
echo -e "\033[1;97mPort OVPN WS     : 80\033[0m"
echo -e "\033[1;97mPort OVPN SSL    : 443\033[0m"
echo -e "\033[1;96m──────────────────────────────────\033[0m"
echo "0 4 * * * /sbin/shutdown -r +15" >> /var/spool/cron/crontabs/root
echo
echo
history -c;
rm setup.sh
rm finish.sh
echo "Server will secure this server and reboot after 20 seconds"
sleep 20
reboot