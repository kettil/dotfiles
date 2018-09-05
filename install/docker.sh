#!/bin/bash

DF_DOCKER_BIN="docker-bin"
DF_DOCKER_PRE="dotfiles-docker"

df_install() {
    echo "####################"
    echo "# docker-scripts : create symbolic links"
    # remove all links
    rm -f ${DF_DOCKER_PRE}-build-*
    rm -f ${DF_DOCKER_PRE}-rm-*
    # create links
    for file in ../docker/*; do
        if [ -d "$file" ]; then
            ln -s ../docker/docker-build.sh ${DF_DOCKER_PRE}-build-$(basename "${file}")
            ln -s ../docker/docker-rm.sh    ${DF_DOCKER_PRE}-rm-$(basename "${file}")
        fi
    done
}

if [ "$(which docker | cut -d" " -f1)" == "" ]; then
    exit
fi

cd "$DF_DOCKER_BIN"

case "$1" in
    install)
        df_install
        ;;
    update)
        df_install
        ;;
    *)
        echo "Usage: $0 {install|update}"
esac
echo ""
