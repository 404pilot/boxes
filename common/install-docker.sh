#!/bin/bash
set -x
set -e

## install docker
sudo wget -qO- https://get.docker.com/ | sh \
    && sudo usermod -aG docker vagrant
