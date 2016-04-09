#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

CONFIG_FILE=~/.chrome-remote-desktop-session

# Install lxde
sudo apt-get install --yes lxde

# Install chrome remote desktop config file
cat << EOF | tee $CONFIG_FILE
exec /usr/bin/startlxde

EOF

# Fix startup problem(start with 20)
#Reference
#* https://www.debuntu.org/how-to-managing-services-with-update-rc-d/
#sudo update-rc.d -f chrome-remote-desktop defaults 20

echo "Restart required!"

