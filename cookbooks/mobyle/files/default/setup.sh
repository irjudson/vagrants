#!/usr/bin/env bash
# 
# Setup for mobyle/bioinformatics
#
# (c) 2011 Ivan R. Judson
#

apt-get update
apt-get upgrade -y

apt-get install -y med-tasks med-bio med-bio-dev
apt-get install -y bio-linux-keyring
apt-get install mafft t-coffee
#apt-get install bio-linux-*

apt-get remove -y gnustep-base-common

/usr/local/mobyle-0.97.2/Tools/mobdeploy deploy