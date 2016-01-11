#! /usr/bin/env bash

DESTINATION=~/gnome-terminal-colors-solarized

if [ ! -d $DESTINATION ]; then
	git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $DESTINATION
fi;

echo "solarized dark downloaded in $DESTINATION"
