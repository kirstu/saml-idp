#!/bin/sh

CERTIFICATE_DIR=$1
CERTIFICATE_NAME=$2

if [ "$CERTIFICATE_DIR" = "" ] || [ "$CERTIFICATE_NAME" = "" ];
then
  echo "Usage: generate-certificates.sh <CERT_PATH> <CERT_NAME>"
  exit 1
fi

CERTIFICATE_FILENAME=$CERTIFICATE_NAME-public-cert.pem
PRIVATE_KEY_FILENAME=$CERTIFICATE_NAME-private-key.pem

CERTIFICATE_PATH="$CERTIFICATE_DIR/$CERTIFICATE_FILENAME"
PRIVATE_KEY_PATH="$CERTIFICATE_DIR/$PRIVATE_KEY_FILENAME"

cd $CERTIFICATE_DIR

# openssl req -x509 -new -newkey rsa:2048 -nodes -subj '/C=US/ST=California/L=San Francisco/O=JankyCo/CN=Test Identity Provider' -keyout "$PRIVATE_KEY_FILENAME" -out "$CERTIFICATE_FILENAME" -days 7300

if [ -e "$CERTIFICATE_PATH" ] && [ -e "$PRIVATE_KEY_PATH" ];
then
  echo 'Certificate and private key exist. Skipping generation.'
else
  echo "Certificate or private key not found. Generating new pair."
  openssl req -x509 -new -newkey rsa:2048 -nodes -subj '/C=US/ST=California/L=San Francisco/O=JankyCo/CN=Test Identity Provider' -keyout "$PRIVATE_KEY_FILENAME" -out "$CERTIFICATE_FILENAME" -days 7300 2> /dev/null
fi

echo "Public certificate. Use this in your application's configuration."
cat "$CERTIFICATE_PATH"
