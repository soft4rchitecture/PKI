#!/bin/bash

# Generate CA private key
openssl genrsa -aes256 -out ca-key.pem 4096

# Generate CA public key
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
