#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

clear
echo "Installing WebSocket."
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/FasterExE/OVPN-Script/main/data/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Mod By Ilyass Najhi
Documentation=https://t.me/IlyassExE
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 80
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn