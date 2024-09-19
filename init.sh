mkdir packages
cd packages/
git clone https://github.com/slub/liszt_web
git clone https://github.com/slub/liszt_common
git clone https://github.com/slub/liszt_bibliography
git clone https://github.com/dikastes/zotero-api
ddev typo3-init
scp -r liszt-portal.de:/var/www/webroot/public/fileadmin/user_upload public/fileadmin/user_upload
ddev import-db dev_dump.sql.gz
