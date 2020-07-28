#!/bin/bash

DF_TEMPLATE_ENV="$HOME/.dotfiles.env"
DF_TEMPLATE_ENVTXT="$DF_HOME/templates/.env.txt"
DF_TEMPLATE_SOURCE="$DF_HOME/templates"
DF_TEMPLATE_TARGET="$DF_HOME/configs"

# ###################
# #### condition ####
# ###################

if [ "${HOME}" == "" ]; then
    echo '$HOME is not defined'
    exit
fi

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'
    exit
fi

if [ ! -e "$DF_TEMPLATE_ENV" ]; then
    echo "####################"
    echo "# The file $DF_TEMPLATE_ENV does not exist"
    echo "#"
    echo "# Execute the following command and update the settings"
    echo "#"
    echo "# cp \"$DF_TEMPLATE_ENVTXT\" \"$DF_TEMPLATE_ENV\" && nano \"$DF_TEMPLATE_ENV\""
    echo "#"
    echo ""

    exit
fi

# ###################
# ##### helper ######
# ###################

df_render() {
  DF_TEMPLATE_FILE="$1"

  echo "- ~/.${DF_TEMPLATE_FILE}"

  cp "$DF_TEMPLATE_SOURCE/$DF_TEMPLATE_FILE" "$DF_TEMPLATE_TARGET/.$DF_TEMPLATE_FILE"

  cat "$DF_TEMPLATE_ENV" | grep -v '^#' | grep -v '^$' | while read line; do
    DF_TEMPLATE_RENDER_KEY="$( echo "$line" | cut -d '=' -f 1 )"
    DF_TEMPLATE_RENDER_VALUE="$( echo "$line" | cut -d '=' -f 2- )"

    sed -i '' -e "s;%${DF_TEMPLATE_RENDER_KEY}%;${DF_TEMPLATE_RENDER_VALUE};g" "$DF_TEMPLATE_TARGET/.$DF_TEMPLATE_FILE"
  done

  cat "$DF_TEMPLATE_ENVTXT" | grep -v '^#' | grep -v '^$' | while read line; do
    DF_TEMPLATE_RENDER_KEY="$( echo "$line" | cut -d '=' -f 1 )"

    sed -i '' -e "s;^\(.*\)%${DF_TEMPLATE_RENDER_KEY}%\(.*\)$;#\1%${DF_TEMPLATE_RENDER_KEY}%\2;g" "$DF_TEMPLATE_TARGET/.$DF_TEMPLATE_FILE"
  done
}

# ###################
# ## install setup ##
# ###################

echo "####################"
echo "# template : create files"
df_render "gitconfig"
