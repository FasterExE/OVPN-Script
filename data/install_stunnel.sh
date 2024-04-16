#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

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
