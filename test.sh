#!/bin/bash

declare -A associativeArray=(["master"]="prod" ["integration"]="int" ["staging"]="staging")
branch=`git branch --show`
if [[ -v "associativeArray[$branch]" ]] ; then
  env="${associativeArray[$branch]}"
else
  env="FALSE"
fi

echo "ENV=$env" >> $GITHUB_OUTPUT

declare -A branchkeymap=(["master"]="PLASMO_PROD_KEYS" ["integration"]="PLASMO_INT_KEYS" ["staging"]="PLASMO_STAGING_KEYS")
branch=`git branch --show`
if [[ -v "branchkeymap[$branch]" ]] ; then
  secretkey="${branchkeymap[$branch]}"
else
  secretkey="FALSE"
fi

echo "SECRETKEY=$secretkey" >> $GITHUB_OUTPUT
