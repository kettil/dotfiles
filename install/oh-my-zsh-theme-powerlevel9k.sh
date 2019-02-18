#!/bin/bash

DF_NAME="powerlevel9k"
DF_FULLNAME="oh-my-zsh-theme-${DF_NAME}"
DF_TARGET="${DF_GITS}/oh-my-zsh/custom/themes"

df_install() {
    echo "####################"
    echo "# oh-my-zsh : theme : install (${DF_NAME})"
    if [ -d "${DF_GITS}/${DF_FULLNAME}" ]; then
        cd "${DF_GITS}/${DF_FULLNAME}"
        git pull --rebase --stat origin master
    else
        git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git "${DF_GITS}/${DF_FULLNAME}"
    fi

    echo ""
    echo "####################"
    echo "# oh-my-zsh : theme : create link (${DF_NAME})"
    mkdir -p "${DF_TARGET}"
    ln -sf "${DF_GITS}/${DF_FULLNAME}" "${DF_TARGET}/${DF_NAME}"

}

df_update() {
    echo "####################"
    echo "# oh-my-zsh : theme : update ${DF_NAME}"
    cd "${DF_GITS}/${DF_FULLNAME}"
    git pull --rebase --stat origin master
}

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'
    exit
fi

if [ "${DF_GITS}" == "" ]; then
    echo '$DF_GITS is not defined'
    exit
fi

if [ "$(whoami)" != "$(ls -ld "${DF_HOME}" | awk "{print $3}")" ]; then
    echo "####################"
    echo "# oh-my-zsh : theme : installation is skipped - wrong owner/user"
    echo ""
    return
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
