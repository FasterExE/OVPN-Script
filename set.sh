#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_require.sh
bash install_require.sh
rm install_require.sh

clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_apache2.sh
bash install_apache2.sh
rm install_apache2.sh

clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_socks.sh
bash install_socks.sh
rm install_socks.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_domain.sh
bash install_domain.sh
rm install_domain.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_menu.sh
bash install_menu.sh
rm install_menu.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_openvpn.sh
bash install_openvpn.sh
rm install_openvpn.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_stunnel.sh
bash install_stunnel.sh
rm install_stunnel.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_BBR.sh
bash install_BBR.sh
rm install_BBR.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/install_firewall_kvm.sh
bash install_firewall_kvm.sh
rm install_firewall_kvm.sh


clear
wget https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/finish.sh
bash finish.sh
