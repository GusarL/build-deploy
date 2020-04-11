#!/bin/bash

set -e
echo "Source remote git repo:"
source <(curl -s https://githubusercontent.com/GusarL/build-deploy/master/output.sh)

print_info "ls -la"

print_title "Node JS $(node -v)"
print_title "NPM $(npm -v)"

#Build
print_info "Start build"
npm install

