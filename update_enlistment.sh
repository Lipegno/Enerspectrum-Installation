#!/bin/bash
mkdir /var/app/
pushd /var/app/
git clone $1
pushd Enerspectrum/backend/
npm cache clean
rm -rf node_modules
npm install
pushd server
npm cache clean
rm -rf node_modules
npm install
popd
popd
popd
echo " ###### Installation Complete ###### "
echo ""
echo "Go to /var/app/Enerspectrum/backend"
echo "And please run the command 'node app'"
echo ""
echo "#####################################"


 
