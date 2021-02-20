#!/bin/bash
var_servername="$(dig +short myip.opendns.com @resolver1.opendns.com)"
docker_compose_file="../docker/docker-compose.yml";

echo "IP: ${var_servername}"
echo "PORT: 1194"
echo "Docker compose file: ${docker_compose_file}"
docker-compose -f ${docker_compose_file} run --rm openvpn-tap ovpn_genconfig -c -t -u udp://$var_servername:1194
docker-compose -f ${docker_compose_file} run --rm openvpn-tap touch /etc/openvpn/vars
docker-compose -f ${docker_compose_file} run --rm openvpn-tap ovpn_initpki nopass
docker-compose -f ${docker_compose_file} up -d openvpn-tap
./add-10-random-tap-users.sh