#! /bin/bash

cd "$(dirname "${BASH_SOURCE}")";

apt-get install -y --force-yes git

git config --global http.sslCAinfo /etc/ssl/certs/cacert.pem

# Cache credential for 15mins by default
git config --global credential.helper cache

git clone https://github.com/githubutilities/dotfiles.git >/dev/null 2>&1 && echo "git successfully installed." && rm -rf dotfiles

