#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo "$0" "$@"
   exit
fi
#Gets the os Version
OS_VER=$(lsb_release -sr)
echo "$OS_VER"

if [ "$OS_VER" = "16.04" ];
then
    echo "Adding Xenial repos"
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    pushd Xenial
    cp mongodb.service /etc/systemd/system/
    popd
else
    echo "If you're not using Xenial hope you're using Ubuntu Trusty"
    echo "#### This has only been tested on Ubuntu 14.04 and 16.04 ####"
    ## Install mongodb: Need to add custom repository to get an up-to-date version
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
fi

apt-get update
apt-get install -y $(cat PACKAGES)

## Install redis--version on apt-get is out-of-date
mkdir temp
wget http://download.redis.io/redis-stable.tar.gz -O ./temp/redis.tar.gz
tar -xzf ./temp/redis.tar.gz -C ./temp
pushd ./temp/redis-stable/
make
make install
pushd utils
echo "Installing Redis Server"
sh ./install_server.sh
pwd
popd
popd
echo "Removing the Folder"
pwd
rm -rf ./temp/
echo "Adding Redis to Startup"
update-rc.d redis_6379 defaults

