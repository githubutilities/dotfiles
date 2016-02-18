#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Ask sudo upfront
sudo -v

sudo apt-get install --yes secure-delete
# Right click and select wipe
sudo apt-get install --yes nautilus-wipe
# A GUI Disk Utility
sudo apt-get install --yes bleachbit

# Use shred instead, checkout `cheat shred` and http://askubuntu.com/questions/57572/how-to-delete-files-in-secure-manner
# * A guide for full disk encryption with ubuntu - https://thesimplecomputer.info/full-disk-encryption-with-ubuntu
# * Encrypt Home Folder in Ubuntu with `ecryptfs-utils` and `cryptsetup` - http://askubuntu.com/questions/366749/enable-disk-encryption-after-installation
