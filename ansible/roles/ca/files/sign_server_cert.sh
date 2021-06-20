#! /bin/bash

SAN=DNS:openvpn.ninjhah.co.za openssl req -new -config ./server-cert.cnf -out certs/openvpn.ninjhah.co.za.csr -keyout certs/openvpn.ninjhah.co.za.key
openssl ca -batch -config ./signing-ca.cnf -in certs/openvpn.ninjhah.co.za.csr -out certs/openvpn.ninjhah.co.za.crt -extensions server_ext