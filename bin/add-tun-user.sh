#!/bin/bash
mkdir -p ./tun-users
docker-compose run --rm openvpn-tun easyrsa build-client-full $1 nopass
docker-compose run --rm openvpn-tun ovpn_getclient $1 > ./tun-users/$1.ovpn