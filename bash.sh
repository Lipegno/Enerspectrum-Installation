
#!/bin/bash
OS_VER=$(lsb_release -sr)
VER="16.04"
echo "$OS_VER"
echo "$VER"

if [ "$OS_VER" = "$VER" ];
then
    echo "Adding Xenial repos"
    exit
else
    echo "If you're not using Xenial hope you're using Ubuntu Trusty"
    echo "#### This has only been tested on Ubuntu 14.04 and 16.04 ####"
    exit
fi


