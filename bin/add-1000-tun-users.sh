#!/bin/bash
for i in {1..1000}
do
    var_clientname="$i-tun";
    docker-compose run --rm openvpn-tun easyrsa build-client-full $var_clientname nopass
    docker-compose run --rm openvpn-tun ovpn_getclient $var_clientname > ./tun-users/$var_clientname.ovpn
done