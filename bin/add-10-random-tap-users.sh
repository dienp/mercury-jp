#!/bin/bash
for i in {1..10}
do
    prefix=$(openssl rand -base64 12);
    var_clientname="${prefix}.tap";
    ./add-tap-user.sh $var_clientname
done