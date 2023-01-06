# Creating a PKI

## Goal

The aim of this project is to get started quickly with CA, client and server certs.

## Creating the CA

Run script `./CA-generate-key-pair.sh`. This will generate both the private key (ca-key.pem ) and its certificate (ca.pem).

## Signing keys with CA

- Point shell at the root of the current git repository
- Generating key pair for client for domain client:

```shell
./generate-key-pair.sh \
  client \
  ca-key.pem \
  ca.pem \
  ./certificate-extensions/extfile-client.cnf \
  client
```

- Generating key pair for server for domain localhost:

```shell
./generate-key-pair.sh \
  server \
  ca-key.pem \
  ca.pem \
  ./certificate-extensions/extfile.cnf \
  localhost
```
