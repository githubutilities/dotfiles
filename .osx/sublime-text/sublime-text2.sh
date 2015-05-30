#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

SUBLIME_SETTING_GIT_REPOSITORY=git@github.com:githubutilities/sublime2_user_settings.git
SUBLIME_SETTING_DIRECTORY=sublime2-setting
TARGET_SUBLIME_SETTING_DIRECTORY=~/Library/"Application Support"/"Sublime Text 2"/Packages/User

function updateSublimeSettingDirectory() {
	local ret;
	if [ ! -d $SUBLIME_SETTING_DIRECTORY ]; then
		git clone $SUBLIME_SETTING_GIT_REPOSITORY $SUBLIME_SETTING_DIRECTORY 2>&1 1> /dev/null;
		ret=$?;
	else
		cd $SUBLIME_SETTING_DIRECTORY;
		git pull origin master 2>&1 1> /dev/null;
		ret=$?;
		cd ..;
	fi;
	return $ret;
}

function doIt() {
	rm -rf "${TARGET_SUBLIME_SETTING_DIRECTORY}";
	local SUBLIME_SETTING_DIRECTORY_PATH=$(pwd)/$SUBLIME_SETTING_DIRECTORY;
	ln -s "${SUBLIME_SETTING_DIRECTORY_PATH}" "${TARGET_SUBLIME_SETTING_DIRECTORY}";
	echo "";
	echo "Sublime setting(${SUBLIME_SETTING_DIRECTORY_PATH}) symlinked.";
}

echo "Updating sublime setting..."
updateSublimeSettingDirectory;

if [ $? -ne 0 ]; then
	echo "Fail to update sublime setting. Check your internet connection."
	echo "Abort..."
	exit 1;
else
	echo "Sublime setting updated."
	echo ""
fi;

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

unset updateSublimeSettingDirectory;
unset doIt;
unset SUBLIME_SETTING_GIT_REPOSITORY;
unset SUBLIME_SETTING_DIRECTORY;
unset TARGET_SUBLIME_SETTING_DIRECTORY;
