#!/bin/sh

DF_PATH="$(dirname "${0}")/../docker"
DF_NAME="$(basename "${0}")"

# whether the name scheme is correct
if [ "${DF_NAME:0:22}" != "dotfiles-docker-build-" ]; then
    echo ""
    echo "Wrong file name scheme."
    echo ""
    echo "- expected: dotfiles-docker-build-<name>"
    echo "- found:    ${DF_NAME}"
    exit -1
fi

# changes into the docker folder
cd "${DF_PATH}"

# extract project folder name
DF_FOLDER="${DF_NAME:22}"

# exist the dockerfile folder
if [ "$DF_FOLDER" == "" ] || [ ! -e "$DF_FOLDER" ]; then
    echo ""
    echo "Dockfile folder '$DF_FOLDER' not found."

    exit -1
fi

# remove old docker container, if exists
if [ $(docker image ls | grep "dotfiles/${DF_FOLDER}" | wc -l) -gt 0 ]; then
    docker image rm -f dotfiles/${DF_FOLDER}
fi

# build docker container
docker image build -t dotfiles/${DF_FOLDER} "$DF_FOLDER"

# redirects the exit status
exit $?
