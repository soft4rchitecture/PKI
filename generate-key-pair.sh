#!/bin/bash

key_name=$1
ca_key=$2
ca_cert=$3
ext_file=$4
common_name=$5

# Generate private key
openssl genrsa -out "$key_name-key.pem" 4096

certificate_signing_request="$key_name.csr"

# Generate Certificate Signing Request
openssl req -subj "/CN=$common_name" -sha256 -new -key "$key_name-key.pem" -out "$certificate_signing_request"

## Generate the signed certificate
signed_certificate="$key_name-cert.pem"
openssl x509 -req -days 365 -sha256 -in "$certificate_signing_request" -CA "$ca_cert" -CAkey "$ca_key" \
  -CAcreateserial -out "$signed_certificate" -extfile "$ext_file"
