#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

INSTALL=./extensions/install-helper.sh

$INSTALL google-define
$INSTALL lock
$INSTALL abbreviation
$INSTALL bring-to-front