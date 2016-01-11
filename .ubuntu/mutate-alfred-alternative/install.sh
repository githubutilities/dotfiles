#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

sudo add-apt-repository --yes ppa:mutate/ppa
sudo apt-get update
sudo apt-get --yes install mutate
