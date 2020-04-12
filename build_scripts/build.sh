#!/bin/bash

set -e
echo "Source remote git repo:"
source <(curl -s https://githubusercontent.com/GusarL/build-deploy/master/output.sh)

echo $(ls -la)

echo "Node JS $(node -v)"
echo "NPM $(npm -v)"

#Lint 
echo "Linter start"
#FIXME: need check 
npm run linter || true

#Build
echo "Start build"
npm install

#Test
echo "Start tests"
npm run test
