#!/bin/bash

df_install() {
    echo "####################"
    echo "# kubernetes : kubectx : install"
    if [ -d "${DF_GITS}/kubectx" ]; then
        cd "${DF_GITS}/kubectx"
        git pull --rebase --stat origin master
    else
        git clone --depth=1 https://github.com/ahmetb/kubectx "${DF_GITS}/kubectx"
    fi

    echo ""
    echo "####################"
    echo "# kubernetes : kubectx : executable"
    chmod 755 "${DF_GITS}/kubectx/kubectx"
    chmod 755 "${DF_GITS}/kubectx/kubens"

    echo ""
    echo "####################"
    echo "# kubernetes : kubectx : create links"
    # scripte
    ln -sf "${DF_GITS}/kubectx/kubectx" "${DF_HOME}/bin/kubectx"
    ln -sf "${DF_GITS}/kubectx/kubens" "${DF_HOME}/bin/kubens"
    # completions
    mkdir -p "${DF_GITS}/oh-my-zsh/completions"
    ln -sf "${DF_GITS}/kubectx/completion/kubectx.zsh" "${DF_GITS}/oh-my-zsh/completions/kubectx.zsh"
    ln -sf "${DF_GITS}/kubectx/completion/kubens.zsh" "${DF_GITS}/oh-my-zsh/completions/kubens.zsh"
}

if [ "$(which kubectl | cut -d" " -f1)" == "" ]; then
    return
fi

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'
    exit
fi

if [ "${DF_GITS}" == "" ]; then
    echo '$DF_GITS is not defined'
    exit
fi

if [ "$(whoami)" != "$(ls -ld "${DF_HOME}" | awk '{print $3}')" ]; then
    return
fi

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
