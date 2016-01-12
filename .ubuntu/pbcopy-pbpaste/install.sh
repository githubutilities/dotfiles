#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

sudo apt-get --yes install xsel

ALIAS_FILE=~/.extra
BASH_PROFILE=~/.bash_profile

# sourcing profile
. $BASH_PROFILE

alias pbcopy pbpaste >/dev/null 2>&1 || {
	echo "# pbcopy and pbpaste alias" >> $ALIAS_FILE;
	echo "alias pbcopy='xsel --clipboard --input'" >> $ALIAS_FILE;
	echo "alias pbpaste='xsel --clipboard --output'" >> $ALIAS_FILE;
	echo "" >> $ALIAS_FILE;
}
