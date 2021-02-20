#!/bin/bash

# tun or tap
vpn_type=$1

for i in {1..10}
do
    prefix=$(openssl rand -base64 12);
    var_clientname="${prefix}.${vpn_type}";
    ./add-user.sh $var_clientname $vpn_type
done