#! /bin/bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask for the administrator password upfront
sudo -v

# Install coreutils for utilities like env
sudo apt-get install -y --force-yes coreutils
# List coreutils package contents
#dpkg -L coreutils

# Install locale for setting LC_ALL variable
sudo apt-get install -y --force-yes com.linusyang.localeutf8

# Install file command
sudo apt-get install -y --force-yes file

# Install less command
sudo apt-get install -y --force-yes less

# Install grep command
sudo apt-get install -y --force-yes grep

# Install ps command
sudo apt-get install -y --force-yes adv-cmds

