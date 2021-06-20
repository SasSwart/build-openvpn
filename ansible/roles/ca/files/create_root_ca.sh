#! /bin/bash
cp /dev/null ca/root-ca/db/root-ca.db
cp /dev/null ca/root-ca/db/root-ca.db.attr
echo 01 > ca/root-ca/db/root-ca.crt.srl
echo 01 > ca/root-ca/db/root-ca.crl.srl

openssl req -new -config ./root-ca.cnf -out ca/root-ca.csr -keyout ca/root-ca/private/root-ca.key
openssl ca -batch -selfsign -config ./root-ca.cnf -in ca/root-ca.csr -out ca/root-ca.crt -extensions root_ca_ext