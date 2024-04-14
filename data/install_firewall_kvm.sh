#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

clear
echo "Installing iptables."
iptables -t nat -A PREROUTING -p udp --dport 20000:50000 -j DNAT --to-destination :5666
ip6tables -t nat -A PREROUTING -p udp --dport 20000:50000 -j DNAT --to-destination :5666
echo "net.ipv4.ip_forward = 1
net.ipv4.conf.all.rp_filter=0
net.ipv4.conf.eth0.rp_filter=0
net.core.wmem_max=16777216
net.core.rmem_max=16777216
net.ipv4.tcp_rmem=4096 262144 16777216
net.ipv4.tcp_wmem=4096 262144 16777216" > /etc/sysctl.conf
sysctl -p
