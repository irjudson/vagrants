#!/usr/bin/env bash
#
# This sets up the environment.
#
# (c) 2011 Ivan R. Judson
#

bundle install

git clone https://github.com/opscode/cookbooks.git cookbooks/opscode

echo "Your environment is setup. You may now instantiate vagrant boxes."