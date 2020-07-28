#!/bin/bash

DF_FILE="zshrc"

# ###################
# #### condition ####
# ###################

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'

    exit 1
fi

# ###################
# ## install setup ##
# ###################

if [ "$(whoami)" == "$(ls -ld "${DF_HOME}" | awk '{print $3}')" ]; then
    echo "####################"
    echo "# zshrc : change config"
    cat "${DF_HOME}/templates/zshrc.sh"                     \
        | sed "s|^export DOTS=.*$|export DOTS=${DF_HOME}|"  \
        > "${DF_HOME}/zshrc.sh"
fi

echo ""
echo "####################"
echo "# zshrc : create symlink"
ln -fs "${DF_HOME}/zshrc.sh" ~/.zshrc
