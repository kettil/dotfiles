#!/bin/bash

# ###################
# #### condition ####
# ###################

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
echo "# dotfiles : create symlinks"

find "$DF_HOME/configs" -type f |
    grep -vi '/README' |
    grep -vi '.md$' |
    while read line; do
        DF_FILE="${line/$DF_HOME\/configs\//}"
        echo "- ~/${DF_FILE}"
        mkdir -p "$(dirname ~/"${DF_FILE}")"
        ln -sf "$DF_HOME/configs/${DF_FILE}" ~/"${DF_FILE}"
    done
