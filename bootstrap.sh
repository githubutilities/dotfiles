#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function copyIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	source ~/.bash_profile;
}

function symlinkIt() {
	ls -a | awk '!/^.$/ && !/^..$/        \
		&& !/^.git$/                      \
		&& !/^.DS_Store$/                 \
		&& !/^bootstrap.sh$/              \
		&& !/^README.md$/                 \
		&& !/^LICENSE-MIT.txt$/           \
		' | xargs -I {} sh -c '           \
			rm -rf ~/{} 2> /dev/null;
			ln -s $(pwd)/{} ~/
		'
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	copyIt;
elif [ "$1" == "--link" ]; then
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		symlinkIt;
	fi;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		copyIt;
	fi;
fi;
unset copyIt;
unset symlinkIt;
