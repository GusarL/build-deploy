#!/bin/bash

set -e
echo "Source remote git repo:"
source <(curl -s https://raw.githubusercontent.com/MaksymSemenykhin/bash_scripts/master/output.sh)

print_info $(ls -la)

print_title "Node JS $(node -v)"
print_title "NPM $(npm -v)"

#Build
print_info "Start build"
npm install

#Lint
print_info "Linter start"
#FIXME: need check
npm run linter || true


