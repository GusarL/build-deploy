#!/bin/bash -e

#Deploy part

echo "Source remote git repo:"
source <(curl -s https://githubusercontent.com/GusarL/build-deploy/master/output.sh)

echo "Start deploy"
