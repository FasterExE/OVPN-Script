#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

apt update
apt install -y curl wget cron python-minimal libpython-stdlib
apt install -y iptables
apt install -y openvpn netcat neofetch vnstat
apt install -y screen stunnel4 gnutls-bin python
apt install -y nload
apt install -y dos2unix nano unzip jq virt-what net-tools
apt install -y mlocate dh-make libaudit-dev build-essential fail2ban
apt-get -o Acquire::ForceIPv4=true install python dos2unix stunnel4 screen curl -y
clear
