#!/bin/bash
mkdir /var/app/
pushd /var/app/
git clone $1
#npm update
popd
pushd ~/Enerspectrum-Install/Enerspectrum-Installation/temp/utils
echo "Installing Redis Server"
source ./install_server.sh
pwd
popd
echo "Removing the Folder"
pwd
rm -rf ./temp/
echo "Adding Redis to Startup"
update-rc.d redis_6379 defaults








 
