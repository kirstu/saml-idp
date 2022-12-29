#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

$SCRIPT_PATH/generate-certificates.sh $(pwd) idp

yarn start
