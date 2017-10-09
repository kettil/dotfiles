#!/bin/bash

DF_NAME="oh-my-zsh"

df_install() {
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
        | sed "s|^\(plugins=.*\)$|#=\1|"                                            \
        | sed "s|^# \(DISABLE_AUTO_UPDATE.*\)$|\1|"                                 \
        | awk '/DISABLE_AUTO_UPDATE/{print "DISABLE_UPDATE_PROMPT=\"true\""}1'      \
        > "${DF_HOME}/zshrc_oh-my-zsh.sh"
}

df_update() {
    echo "####################"
    echo "# oh-my-zsh : update"
    cd "${DF_GITS}/${DF_NAME}"
    git pull --rebase --stat origin master
}

if [ "${DF_HOME}" == "" ] || [ "${DF_GITS}" == "" ]; then
    echo '$DF_HOME or $DF_GITS is not defined'
    exit
fi

case "$1" in
  install)
    df_install
    ;;
  update)
    df_update
    ;;
  *)
    echo "Usage: $0 {install|update}"
esac
echo ""
