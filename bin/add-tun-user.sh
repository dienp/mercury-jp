#!/bin/bash
docker_compose_file="../docker/docker-compose.yml";
mkdir -p ./tun-users

echo "Docker compose file: ${docker_compose_file}"

docker-compose -f ${docker_compose_file} run --rm openvpn-tun easyrsa build-client-full $1 nopass
docker-compose -f ${docker_compose_file} run --rm openvpn-tun ovpn_getclient $1 > ./tun-users/$1.ovpn