#!/bin/bash

DF_NAME="oh-my-zsh"

# ###################
# #### condition ####
# ###################

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'

    exit 1
fi

if [ "${DF_GITS}" == "" ]; then
    echo '$DF_GITS is not defined'

    exit 1
fi

if [ "$(whoami)" != "$(ls -ld "${DF_HOME}" | awk '{print $3}')" ]; then
    return
fi

# ###################
# ## install setup ##
# ###################

echo "####################"
echo "# oh-my-zsh : install"
if [ -d "${DF_GITS}/${DF_NAME}" ]; then
    cd "${DF_GITS}/${DF_NAME}"
    git pull --rebase --stat origin master
else
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "${DF_GITS}/${DF_NAME}"
fi

echo ""
echo "####################"
echo "# oh-my-zsh : create config file"
cat "${DF_GITS}/${DF_NAME}/templates/zshrc.zsh-template"                        \
    | sed "s|^export ZSH=.*$|export ZSH=${DF_GITS}/${DF_NAME}|"                 \
    | sed "s|^\(ZSH_THEME=.*\)$|#=\1|"                                          \
    | perl -lpe 'BEGIN{undef $/;} s/^plugins=.*\)/#=plugins=()/smg'             \
    | sed "s|^# \(DISABLE_AUTO_UPDATE.*\)$|\1|"                                 \
    | awk '/DISABLE_AUTO_UPDATE/{print "DISABLE_UPDATE_PROMPT=\"true\""}1'      \
    > "${DF_HOME}/zshrc_oh-my-zsh.sh"
