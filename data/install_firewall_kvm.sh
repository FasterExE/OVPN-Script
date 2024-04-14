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
{
iptables -F
iptables -t nat -A POSTROUTING -s 10.20.0.0/22 -o "$server_interface" -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.20.0.0/22 -o "$server_interface" -j SNAT --to-source "$server_ip"
iptables -t nat -A POSTROUTING -s 10.30.0.0/22 -o "$server_interface" -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.30.0.0/22 -o "$server_interface" -j SNAT --to-source "$server_ip"
iptables -t filter -A INPUT -p udp -m udp --dport 20100:20900 -m state --state NEW -m recent --update --seconds 30 --hitcount 10 --name DEFAULT --mask 255.255.255.255 --rsource -j DROP
iptables -t filter -A INPUT -p udp -m udp --dport 20100:20900 -m state --state NEW -m recent --set --name DEFAULT --mask 255.255.255.255 --rsource
iptables-save > /etc/iptables_rules.v4
ip6tables-save > /etc/iptables_rules.v6
}&>/dev/null