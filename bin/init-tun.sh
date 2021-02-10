#!/bin/bash
var_servername="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "IP: ${var_servername}"
echo "PORT: 1195"
docker-compose run --rm openvpn-tun ovpn_genconfig -u udp://$var_servername:1195
docker-compose run --rm openvpn-tun touch /etc/openvpn/vars
docker-compose run --rm openvpn-tun ovpn_initpki nopass
docker-compose --project-directory "../docker"  up -d openvpn-tun