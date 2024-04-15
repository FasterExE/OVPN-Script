#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

clear
echo 'Installing menu.'
rm /usr/local/bin/menu
rm /usr/local/bin/add-user
rm /usr/local/bin/del-user
rm /usr/local/bin/on-user
wget -O /usr/local/bin/menu https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/menu
chmod +x /usr/local/bin/menu
wget -O /usr/local/bin/add-user https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/add-user
chmod +x /usr/local/bin/add-user
wget -O /usr/local/bin/del-user https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/del-user
chmod +x /usr/local/bin/del-user
wget -O /usr/local/bin/on-user https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/on-user
chmod +x /usr/local/bin/on-user
clear
