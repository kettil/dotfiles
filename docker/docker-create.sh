#!/bin/sh

cd "$(dirname "${0}")"

if [ $(docker image ls | grep "dotfiles/${1}" | wc -l) -ne 1 ]; then
    ../docker-bin/dotfiles-docker-build-${1}
fi
