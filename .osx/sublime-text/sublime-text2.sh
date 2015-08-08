#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

SUBLIME_SETTING_GIT_REPOSITORY=https://github.com/githubutilities/sublime2_user_settings.git
TARGET_SUBLIME_SETTING_DIRECTORY=~/Library/"Application Support"/"Sublime Text 2"/Packages/User

function doIt() {
	if [ ! -d "${TARGET_SUBLIME_SETTING_DIRECTORY}" ]; then
		git clone $SUBLIME_SETTING_GIT_REPOSITORY "${TARGET_SUBLIME_SETTING_DIRECTORY}" 2>&1 1> /dev/null;
	else
		# if it is not a git repository, clone it
		if [ ! -d "${TARGET_SUBLIME_SETTING_DIRECTORY}"/.git ]; then
			rm -rf "${TARGET_SUBLIME_SETTING_DIRECTORY}";
			git clone $SUBLIME_SETTING_GIT_REPOSITORY "${TARGET_SUBLIME_SETTING_DIRECTORY}" 2>&1 1> /dev/null;
		else
			echo "Updating sublime setting..."
			cd "${TARGET_SUBLIME_SETTING_DIRECTORY}";
			git pull origin master 2>&1 1> /dev/null;
			cd -;
		fi;
	fi;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	if [[ -d "${TARGET_SUBLIME_SETTING_DIRECTORY}" || \
		  -f "${TARGET_SUBLIME_SETTING_DIRECTORY}" ]]; then
		read -p "This will remove your sublime user package directory($TARGET_SUBLIME_SETTING_DIRECTORY). Are you sure? (y/n) " -n 1;
		echo "";
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			doIt;
		fi;
	else
		doIt;
	fi;
fi;

unset doIt;
unset SUBLIME_SETTING_GIT_REPOSITORY;
unset TARGET_SUBLIME_SETTING_DIRECTORY;
