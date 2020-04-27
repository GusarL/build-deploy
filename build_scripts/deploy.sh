#!/bin/bash

set -e

#Input params
BRANCHNAME*$1

#Source function
print_info "Source remote git repo:"
source <(curl -s https://raw.githubusercontent.com/MaksymSemenykhin/bash_scripts/master/output.sh)

#Check input params
if [[ $(BRANCHNAME) == ^(dev|master)$ ]]; then
  print_title "Select branch: $BRANCHNAME"
else
  print_error "ERROR. Branch not supported. Script stoped."
fi

#Prereq.
DEPLOY_PLACE="/var/www/nodes/$BRANCHNAME"
mkdir -p "$DEPLOY_PLACE"
print_title "Deploy to $DEPLOY_PLACE"

mkdir -p "$DEPLOY_PLACE/config"
cp ./config/"$BRANCHNAME".json "$DEPLOY_PLACE/config/"$BRANCHNAME".json"

#Deploy part
print_info "Start deploy"

print_info "PM2 version: $(pm2 --version)"
pm2 start

#Test
# echo "Start tests"
# npm run test
