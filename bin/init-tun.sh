#!/bin/bash
var_servername="$(dig +short myip.opendns.com @resolver1.opendns.com)"
docker_compose_file="../docker/docker-compose.yml";
echo "IP: ${var_servername}"
echo "PORT: 1195"
echo "Docker compose file: ${docker_compose_file}"
docker-compose -f ${docker_compose_file} run --rm openvpn-tun ovpn_genconfig -u udp://$var_servername:1195
docker-compose -f ${docker_compose_file} run --rm openvpn-tun touch /etc/openvpn/vars
docker-compose -f ${docker_compose_file} run --rm openvpn-tun ovpn_initpki nopass
docker-compose -f ${docker_compose_file}  up -d openvpn-tun