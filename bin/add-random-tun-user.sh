#!/bin/bash
mkdir -p ./tun-users
docker_compose_file="../docker/docker-compose.yml";
for i in {1..10}
do
    prefix=$(openssl rand -base64 12)
    var_clientname="${prefix}.tun";
    bash ./add-tun-user.sh $var_clientname
done