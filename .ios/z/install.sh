#! /bin/bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

# Install awk dependency
sudo apt-get install -y --force-yes gawk

Z_SH=/etc/profile.d/z.sh

if [ ! -f $Z_SH ]; then
	sudo curl -#L -C - -o $Z_SH https://raw.githubusercontent.com/rupa/z/master/z.sh;
fi;

