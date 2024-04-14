#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

 sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.20.0.0/16 -j MASQUERADE
 sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.30.0.0/16 -j MASQUERADE
