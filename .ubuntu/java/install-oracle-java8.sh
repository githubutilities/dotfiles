#! /usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

sudo add-apt-repository --yes ppa:webupd8team/java
sudo apt-get update
sudo apt-get install --yes oracle-java8-installer

# Configure Java Environment
sudo apt-get install --yes oracle-java8-set-default

# Printing out Java Version
java -version

