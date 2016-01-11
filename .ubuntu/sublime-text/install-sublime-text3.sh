#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

sudo add-apt-repository --yes ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get --yes install sublime-text

