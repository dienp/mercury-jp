#!/bin/bash
read -p 'Enter server IP: ' var_servername
docker-compose run --rm openvpn-tun ovpn_genconfig -u udp://$var_servername:1195
docker-compose run --rm openvpn-tun touch /etc/openvpn/vars
docker-compose run --rm openvpn-tun ovpn_initpki nopass
docker-compose --project-directory "../docker"  up -d openvpn-tun