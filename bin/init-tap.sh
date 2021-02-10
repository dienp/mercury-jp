#!/bin/bash
read -p 'Enter server IP: ' var_servername
docker-compose run --rm openvpn-tap ovpn_genconfig -c -t -u udp://$var_servername:1194
docker-compose run --rm openvpn-tap touch /etc/openvpn/vars
docker-compose run --rm openvpn-tap ovpn_initpki nopass
docker-compose --project-directory "../docker" up -d openvpn-tap