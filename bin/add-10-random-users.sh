#!/bin/bash

# tun or tap
vpn_type=$1

for i in {1..10}
do
    var_clientname="${i}.${vpn_type}";
    ./add-user.sh $var_clientname $vpn_type
done