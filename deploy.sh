#!/bin/bash

set -e

#Input params
BRANCHNAME=$1

#Source function
echo "Source remote git repo:"
source <(curl -s https://raw.githubusercontent.com/MaksymSemenykhin/bash_scripts/master/output.sh)

#Check input params
if [[ $BRANCHNAME =~ ^(dev|master)$ ]]; then
  print_title "Select branch: $BRANCHNAME"
else
  print_error "ERROR. Branch not supported. Script stoped."
fi

#Prereq.
DEPLOY_PLACE="/var/www/nodes/$BRANCHNAME"
mkdir -p "$DEPLOY_PLACE"
print_title "Deploy to $DEPLOY_PLACE"

#Prepare config
sed -i s#%ENV%#$BRANCHNAME#g ./ecosystem.config.js
sed -i s#development#$BRANCHNAME#g ./ecosystem.config.js

#Deploy part
print_info "Start deploy"

mkdir -p "$DEPLOY_PLACE/config"
cp ./config/"$BRANCHNAME".json "$DEPLOY_PLACE/config/local.config.json"

print_info "Print ecosystem js file:"
cat ecosystem.config.js

print_info "Print app config file:"
cat "$DEPLOY_PLACE/config/local.config.json"

print_title "Copy app $DEPLOY_PLACE"
cp -r . "$DEPLOY_PLACE"

print_info "PM2 version: $(pm2 --version)"
cd "$DEPLOY_PLACE"
export NODE_ENV="$BRANCHNAME"
pm2 start

#Test
 print_title "Start tests"
 npm run test
