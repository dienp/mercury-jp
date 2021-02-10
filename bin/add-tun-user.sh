#!/bin/bash
read -p 'Enter client name: ' var_clientname
docker-compose run --rm openvpn-tun easyrsa build-client-full $var_clientname nopass
docker-compose run --rm openvpn-tun ovpn_getclient $var_clientname > ./tun-users/$var_clientname-tun.ovpn