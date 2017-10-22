#!/bin/sh

DF_PATH="$(dirname "${0}")/../docker"
DF_NAME="$(basename "${0}")"

# whether the name scheme is correct
if [ "${DF_NAME:0:19}" != "dotfiles-docker-rm-" ]; then
    echo ""
    echo "Wrong file name scheme."
    echo ""
    echo "- expected: dotfiles-docker-rm-<name>"
    echo "- found:    ${DF_NAME}"
    exit -1
fi

# changes into the docker folder
cd "${DF_PATH}"

# extract project folder name
DF_FOLDER="${DF_NAME:19}"

# exist the dockerfile folder
if [ "$DF_FOLDER" == "" ] || [ ! -e "$DF_FOLDER" ]; then
    echo ""
    echo "Dockfile folder '$DF_FOLDER' not found."

    exit -1
fi

# remove docker container
docker image rm dotfiles/${DF_FOLDER}

# redirects the exit status
exit $?
