#!/bin/bash
var_servername="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "IP: ${var_servername}"
echo "PORT: 1195"
docker_compose_file="../docker/docker-compose.yml";
echo "Docker compose file: ${docker_compose_file}"
docker-compose -f ${docker_compose_file} run --rm openvpn-tun ovpn_genconfig -n 127.0.0.1 -u udp://$var_servername:1195
docker-compose -f ${docker_compose_file} run --rm openvpn-tun touch /etc/openvpn/vars
docker-compose -f ${docker_compose_file} run --rm openvpn-tun ovpn_initpki nopass
docker-compose -f ${docker_compose_file}  up -d openvpn-tun