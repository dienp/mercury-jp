#!/bin/bash
mkdir -p ~/home/adguardhome/work
mkdir -p ~/home/adguardhome/conf

docker run --name adguardhome \
    -v ~/home/adguardhome/work:/opt/adguardhome/work \
    -v ~/home/adguardhome/conf:/opt/adguardhome/conf \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80/tcp -p 3000:3000/tcp \
    -p 443:443/tcp \
    -p 853:853/tcp \
    -d adguard/adguardhome