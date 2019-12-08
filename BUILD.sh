#!/usr/bin/env bash
# Some of the tools in this toolchain simply don't support python3 yet.
# Here we wrap the build in a virtualenv environment.

FORKS=${FORKS:=1}

if [ ! -f ./bin/activate ]; then
  virtualenv -p python2 .
fi

git submodule update --init --recursive

. bin/activate
make -j1 FORKS=$FORKS
