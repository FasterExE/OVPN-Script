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
 sudo apt-get install --reinstall iptables-persistent
 sudo sysctl -p
 sudo apt-get install --reinstall iptables-persistent
 sudo sysctl -p
