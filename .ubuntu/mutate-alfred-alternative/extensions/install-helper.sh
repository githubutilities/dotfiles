#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

if [ $# -ne 1 ]; then
	echo "Usage: install-helper.sh <extension-name>";
	exit;
fi;

EXTENSION=$1

source $EXTENSION/config.sh

CONFIG_FILE=~/.config/Mutate/config.ini
EXTENSIONS_PATH=~/.ubuntu/mutate-alfred-alternative/extensions

COUNT=$(cat $CONFIG_FILE | grep "^\[$TRIGGER_KEYWORD\]$" | wc -l)
if [ $COUNT -ne 0 ]; then
	echo "$EXTENSION_NAME extension already installed";
	exit;
fi;

cat >> $CONFIG_FILE <<EOF
[$TRIGGER_KEYWORD]
ScriptAddress=$EXTENSIONS_PATH/$EXTENSION_NAME/main
IconAddress=$EXTENSIONS_PATH/$EXTENSION_NAME/icon.png
HotKey=
Argument=need
EOF
