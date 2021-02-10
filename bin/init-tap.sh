#!/bin/bash
read -p 'Enter server IP: ' var_servername
# 1194
read -p 'Enter port: ' port
docker-compose run --rm openvpn-tap ovpn_genconfig -c -t -u udp://$var_servername:$port
docker-compose run --rm openvpn-tap touch /etc/openvpn/vars
docker-compose run --rm openvpn-tap ovpn_initpki nopass
docker-compose up -d openvpn-tap