
#!/bin/bash
docker_compose_file="../docker/docker-compose.yml";
echo "Docker compose file: ${docker_compose_file}"
mkdir -p ./tap-users
docker-compose -f ${docker_compose_file} run --rm openvpn-tap easyrsa build-client-full $1 nopass
docker-compose -f ${docker-compose_file} run --rm openvpn-tap ovpn_getclient $1 > ./tap-users/$1.ovpn