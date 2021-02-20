#!/bin/bash
var_servername="$(dig +short myip.opendns.com @resolver1.opendns.com)"
docker_compose_file="../docker/docker-compose.yml";

echo "IP: ${var_servername}"

# tun or tap
vpn_type=$1

if [[ -z "$vpn_type" ]]
then
    vpn_type="tap";
fi

docker_service_name="openvpn-${vpn_type}";

echo "Run docker service: ${docker_service_name}"

if [[ $vpn_type = "tap" ]]
then
    docker-compose -f ${docker_compose_file} run --rm ${docker_service_name} ovpn_genconfig -c -t -u udp://$var_servername:1194
    echo "PORT: 1194"
else
    docker-compose -f ${docker_compose_file} run --rm ${docker_service_name} ovpn_genconfig -u udp://$var_servername:1195
    echo "PORT: 1195"
fi

docker-compose -f ${docker_compose_file} run --rm ${docker_service_name} touch /etc/openvpn/vars
docker-compose -f ${docker_compose_file} run --rm ${docker_service_name} ovpn_initpki nopass
docker-compose -f ${docker_compose_file} up -d ${docker_service_name}
./add-10-random-users.sh $vpn_type

