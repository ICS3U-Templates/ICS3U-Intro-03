#!/bin/bash

sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y install --no-install-recommends build-essential gdb
sudo pip3 install cpplint