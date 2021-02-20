#!/bin/bash
docker_compose_file="../docker/docker-compose.yml";

var_clientname=$1

# tun or tap
vpn_type=$2

mkdir -p ./$vpn_type-users

echo "Docker compose file: ${docker_compose_file}"

docker-compose -f ${docker_compose_file} run --rm openvpn-$vpn_type easyrsa build-client-full $var_clientname nopass
docker-compose -f ${docker_compose_file} run --rm openvpn-$vpn_type ovpn_getclient $var_clientname > ./$vpn_type-users/$var_clientname.ovpn