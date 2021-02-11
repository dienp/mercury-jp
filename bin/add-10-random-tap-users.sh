#!/bin/bash
mkdir -p ./tun-users
for i in {1..10}
do
    prefix=$(openssl rand -base64 12);
    var_clientname="${prefix}.tap";
    bash ./add-tap-user.sh $var_clientname
done