#!/bin/bash

DF_DOCKER_CON="${DF_HOME}/docker"
DF_DOCKER_BIN="${DF_HOME}/docker-bin"
DF_DOCKER_PRE="dotfiles-docker"

# ###################
# #### condition ####
# ###################

if [ "$(which docker | cut -d" " -f1)" == "" ]; then
    return
fi

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'
    exit
fi

if [ "$(whoami)" != "$(ls -ld "${DF_HOME}" | awk '{print $3}')" ]; then
    return
fi

# ###################
# ## install setup ##
# ###################

echo "####################"
echo "# docker-scripts : create symbolic links"
# remove all links
rm -f ${DF_DOCKER_BIN}/${DF_DOCKER_PRE}-build-*
rm -f ${DF_DOCKER_BIN}/${DF_DOCKER_PRE}-rm-*
# create links
for file in ${DF_DOCKER_CON}/*; do
    if [ -d "$file" ]; then
        ln -s ${DF_DOCKER_CON}/docker-build.sh ${DF_DOCKER_BIN}/${DF_DOCKER_PRE}-build-$(basename "${file}")
        ln -s ${DF_DOCKER_CON}/docker-rm.sh    ${DF_DOCKER_BIN}/${DF_DOCKER_PRE}-rm-$(basename "${file}")
    fi
done
