#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
    
apt install -y linux-generic-hwe-20.04
grub-set-default 0
echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
INSTALL_BBR=true
sudo sysctl -p
sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.20.0.0/16 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.30.0.0/16 -j MASQUERADE
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
sudo apt-get install iptables-persistent -y
sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.20.0.0/16 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.30.0.0/16 -j MASQUERADE
