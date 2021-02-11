#!/bin/bash
mkdir -p ./tun-users
docker_compose_file="../docker/docker-compose.yml";
for i in {1..1000}
do
    var_clientname="$i-tun";
    bash ./add-tun-user.sh $var_clientname
done