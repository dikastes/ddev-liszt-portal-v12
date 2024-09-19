#!/usr/bin/env bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "Initializing the Liszt Portal development environment"
echo "====================================================="
echo "${bold}1. Cloning the repositories${normal}"
echo "2. Setting up the TYPO3 environment"
echo "3. Importing database and files"
echo "4. Cache flush"

[ ! -d packages ] && mkdir packages
cd packages/
[ ! -d liszt_web ] && git clone https://github.com/slub/liszt_web
[ ! -d liszt_common ] && git clone https://github.com/slub/liszt_common
[ ! -d liszt_bibliography ] && git clone https://github.com/slub/liszt_bibliography
[ ! -d zotero-api ] && git clone https://github.com/dikastes/zotero-api
cd ..

echo "1. Cloning the repositories"
echo "${bold}2. Setting up the TYPO3 environment${normal}"
echo "3. Importing database and files"
echo "4. Cache flush"

ddev typo3-init

echo "1. Cloning the repositories"
echo "2. Setting up the TYPO3 environment"
echo "${bold}3. Importing database and files${normal}"
echo "4. Cache flush"

ddev import-db --file=dev_dump.sql.gz
scp -r test.liszt-portal.de:/var/www/webroot/public/fileadmin/user_upload public/fileadmin/user_upload

echo "1. Cloning the repositories"
echo "2. Setting up the TYPO3 environment"
echo "3. Importing database and files"
echo "${bold}4. Cache flush${normal}"

ddev typo3 cache:flush
