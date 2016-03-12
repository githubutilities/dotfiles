#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v
DEB_FILE=/etc/apt/sources.list.d/google-chrome-remote-desktop.list

cat << EOF | sudo tee $DEB_FILE
deb http://dl.google.com/linux/chrome-remote-desktop/deb/ stable main

EOF
sudo apt-get update
sudo apt-get install --yes chrome-remote-desktop

read -p "Do you want to start chrome remote desktop service? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$  ]]; then
    sudo /etc/init.d/chrome-remote-desktop start
fi;

