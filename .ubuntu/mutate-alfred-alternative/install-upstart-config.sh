#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

UPSTART_CONFIG=~/.config/upstart/mutate.conf

# Run mutate at ubuntu upstart
cat > $UPSTART_CONFIG << EOF
start on desktop-start
stop on desktop-end

exec mutate

# Reference
# * http://askubuntu.com/questions/507496/how-to-start-gui-application-with-upstart

EOF
