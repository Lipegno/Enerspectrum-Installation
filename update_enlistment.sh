#!/bin/bash
mkdir /var/app/
pushd /var/app/
git clone $1
pushd Enerspectrum/backend/
npm install
pushd server
npm install
popd
popd
popd
pushd ~/Enerspectrum-Installation/temp/redis-stable/utils
echo "Installing Redis Server"
sh ./install_server.sh
pwd
popd
echo "Removing the Folder"
pwd
rm -rf ./temp/
echo "Adding Redis to Startup"
update-rc.d redis_6379 defaults








 
