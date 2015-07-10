#!/usr/bin/env bash

function installIt() {
	cd "$( dirname "${BASH_SOURCE[0]}" )"

	# installing "Solarized Dark xterm-256color" theme
	open ../../init/"Solarized Dark xterm-256color.terminal"

	# sleep 5 seconds for `defaults write` to take effect
	sleep 5

	# setting "Solarized Dark xterm-256color" theme as default
	defaults write com.apple.Terminal "Startup Window Settings" "Solarized Dark xterm-256color"
	defaults write com.apple.Terminal "Default Window Settings" "Solarized Dark xterm-256color"

	killall Terminal
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	installIt;
else
	read -p "This script will close `Terminal.app` after installation finishes. Are you ready? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		installIt;
	fi;
fi;
