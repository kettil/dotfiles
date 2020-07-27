#!/bin/bash

# ###################
# #### condition ####
# ###################

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

# ###################
# ## install setup ##
# ###################

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
