#! /bin/bash
cp /dev/null ca/signing-ca/db/signing-ca.db
cp /dev/null ca/signing-ca/db/signing-ca.db.attr
echo 01 > ca/signing-ca/db/signing-ca.crt.srl
echo 01 > ca/signing-ca/db/signing-ca.crl.srl

openssl req -new -config ./root-ca.cnf -out ca/signing-ca.csr -keyout ca/signing-ca/private/signing-ca.key
openssl ca -batch -config ./root-ca.cnf -in ca/signing-ca.csr -out ca/signing-ca.crt -extensions signing_ca_ext