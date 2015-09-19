#!/bin/bash

source ~/.rvm/scripts/rvm

rvm install $1
rvm use $1 --default

shift

if (( $# ))
	then gem install $@
fi