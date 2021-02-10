
#!/bin/bash
read -p 'Enter client name: ' var_clientname
docker-compose run --rm openvpn-tap easyrsa build-client-full $var_clientname nopass
docker-compose run --rm openvpn-tap ovpn_getclient $var_clientname > ./tap-users/$var_clientname-tap.ovpn