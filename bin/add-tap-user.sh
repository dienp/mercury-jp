
#!/bin/bash
mkdir -p ./tap-users
docker-compose run --rm openvpn-tap easyrsa build-client-full $1 nopass
docker-compose run --rm openvpn-tap ovpn_getclient $1 > ./tap-users/$1.ovpn