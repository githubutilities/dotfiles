#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

dconf write /org/compiz/profiles/unity/plugins/core/focus-prevention-level 0

# Reference
# * http://askubuntu.com/questions/128738/when-i-launch-an-app-the-focus-doesnt-move-to-the-opened-app

