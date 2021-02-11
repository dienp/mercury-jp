#!/bin/bash
mkdir -p ~/home/adguardhome/work
mkdir -p ~/home/adguardhome/conf

# Deactivate DNSStubListener and update DNS server address.
mkdir -p /etc/systemd/resolved.conf.d
rm /etc/systemd/resolved.conf.d/adguardhome.conf
cp adguardhome.conf /etc/systemd/resolved.conf.d
mv /etc/resolv.conf /etc/resolv.conf.backup
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl reload-or-restart systemd-resolved

# Run docker container
docker run --name adguardhome \
    -v ~/home/adguardhome/work:/opt/adguardhome/work \
    -v ~/home/adguardhome/conf:/opt/adguardhome/conf \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80/tcp -p 3000:3000/tcp \
    -p 443:443/tcp \
    -p 853:853/tcp \
    -d adguard/adguardhome