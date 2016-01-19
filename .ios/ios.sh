#! /bin/bash

cd "$(dirname "${BASH_SOURCE}")";

# Install sbutils which contain utilities like `sbbundleids`
sudo apt-get install -y --force-yes com.innoying.sbutils

# Install Erica utilities for utilities like `plutil`, `pbcopy` and so on.
sudo apt-get install -y --force-yes com.ericasadun.utilities

# Install activator
sudo apt-get install -y --force-yes libactivator

# Install open command from BigBoss
sudo apt-get install -y --force-yes com.conradkramer.open
# Finding out which package open belongs to
#dpkg -S $(which open)

