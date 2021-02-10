#!/bin/bash
read -p 'Enter server IP: ' var_servername
# 1195
read -p 'Enter port: ' port
docker-compose run --rm openvpn-tun ovpn_genconfig -u udp://$var_servername:$port
docker-compose run --rm openvpn-tun touch /etc/openvpn/vars
docker-compose run --rm openvpn-tun ovpn_initpki nopass
docker-compose up -d openvpn-tun