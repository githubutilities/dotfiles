#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

cat > ~/.Xmodmap << EOF
!Swap left control and left alt
!https://earthviaradio.wordpress.com/2012/02/06/swapping-the-left-alt-and-ctrl-keys-in-ubuntu-11-10/

clear control
clear mod1
keycode 37 = Alt_L Meta_L
keycode 64 = Control_L
add control = Control_L Control_R
add mod1 = Alt_L Meta_L

EOF

echo "Please re-login to finish setting up."

