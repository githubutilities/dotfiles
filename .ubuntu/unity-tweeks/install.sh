#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

sudo apt-get --yes install unity-tweak-tool

echo "1. Run 'unity-tweak-tool'"
echo "2. Disable Unity Dash - \`Show the launcher\` under \`Unity\` -> \`Additional\`."
echo "3. Configure Hotcorners"

