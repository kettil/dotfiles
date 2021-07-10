#
# This file is generated automatically.
#
# Every change is deleted.
#

# path to .dotfiles folder
export DOTS=$HOME/.dotfiles

export TERM="xterm-256color"
export EDITOR=nano

# dotfiles bin folder
export PATH=$DOTS/bin:$PATH

# list of oh-my-zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# homebrew settings
if [ -e /usr/local/bin/brew ]; then
    # brew paths
    export PATH=/usr/local/sbin:$PATH
    export PATH=/usr/local/bin:$PATH
    # brew dotfile path
    export PATH=$DOTS/brew-bin:$PATH
    # coreutils bin folder
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    export PATH=$(brew --prefix gnu-sed)/libexec/gnubin:$PATH

    # disabled homebrew analytics mode
    export HOMEBREW_NO_ANALYTICS=1

    # node.js
    #NVM_LAZY=1
    #NVM_AUTOLOAD=1
    plugins+=(npm nvm)
fi

# added special docker scripts, if docker is installed
if [ "$(which docker | cut -d" " -f1)" != "" ]; then
    plugins+=(docker)

    # add docker-bin to $path variable
    export PATH=$DOTS/docker-bin:$PATH

    if [ "$(which docker-compose | cut -d" " -f1)" != "" ]; then
        plugins+=(docker-compose)
    fi
fi

# added special kubernetes scripts, if kubernetes is installed
if [ "$(which kubectl | cut -d" " -f1)" != "" ]; then
    plugins+=(kubectl)

    # change kubernetes standard editor
    export KUBE_EDITOR="nano"
fi

# added special helm (kubernetes) scripts, if helm is installed
if [ "$(which helm | cut -d" " -f1)" != "" ]; then
    plugins+=(helm)
fi

# load macos plugin if it is a mac
if [ "${OSTYPE:0:6}" = "darwin" ]; then
    plugins+=(osx)
fi

zstyle ':completion:*' special-dirs true

ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status disk_usage command_execution_time time)

# line options
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "

# Visual customisation of the second prompt line
local user_symbol="$ "
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol="# "
fi
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{253}%K{234}%} $user_symbol%{%b%f%k%F{234}%} %{%f%}"

# icons

## Folder
POWERLEVEL9K_HOME_ICON='🌍'
POWERLEVEL9K_HOME_SUB_ICON='🌋'
POWERLEVEL9K_FOLDER_ICON='🎃'
POWERLEVEL9K_ETC_ICON='🔩'
POWERLEVEL9K_LOCK_ICON='🔒'
## Disk
POWERLEVEL9K_DISK_ICON='💿'
## Time
POWERLEVEL9K_TIME_ICON='🕓'
POWERLEVEL9K_EXECUTION_TIME_ICON='⏳'
## VCS
POWERLEVEL9K_VCS_UNTRACKED_ICON='📭'
POWERLEVEL9K_VCS_UNSTAGED_ICON='📬'
POWERLEVEL9K_VCS_STAGED_ICON='📫'
POWERLEVEL9K_VCS_STASH_ICON='📦 '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='📤 '
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='📥 '
#POWERLEVEL9K_VCS_BRANCH_ICON=''
#POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=''
POWERLEVEL9K_VCS_TAG_ICON='🔖 '

#
# left side
#

# os icon
POWERLEVEL9K_OS_ICON_FOREGROUND='253'
POWERLEVEL9K_OS_ICON_BACKGROUND='234'

# root indicator
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='253'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='088'

# context
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='253'
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='241'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='238'

## untested...
##POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='255'
##POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='255'
##POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='255'
##POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='255'
##POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND='255'
##POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND='255'
##POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='255'
##POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='255'

# dir
POWERLEVEL9K_DIR_SHOW_WRITABLE=true

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='253'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='018'
POWERLEVEL9K_DIR_HOME_FOREGROUND='234'
POWERLEVEL9K_DIR_HOME_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='234'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='027'
POWERLEVEL9K_DIR_ETC_FOREGROUND='253'
POWERLEVEL9K_DIR_ETC_BACKGROUND='022'
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='253'
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND='088'

# vcs
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='253'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='238'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='234'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='208'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='253'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='088'

#
# right side
#

# status
POWERLEVEL9K_STATUS_OK_FOREGROUND='046'
POWERLEVEL9K_STATUS_OK_BACKGROUND='241'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='253'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='088'

# disk options
POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95

POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND='253'
POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND='022'
POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND='234'
POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND='208'
POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND='253'
POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND='088'

# execution time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=60
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='253'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='088'

# time
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
POWERLEVEL9K_TIME_FOREGROUND='253'
POWERLEVEL9K_TIME_BACKGROUND='234'

#
# load external files and alias
#

if [ -e "$HOME/.zshrc_pre.zsh" ]; then
    source $HOME/.zshrc_pre.zsh
fi

source $DOTS/zshrc_oh-my-zsh.sh

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

#
# alias list
#

alias ls='ls -F ${colorflag}'
alias ll='ls -lisahF ${colorflag}'
alias nano='/usr/local/bin/nano -lc'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# creates a folder and goes into it
mkcdir() { mkdir -p -- "$1" &&  cd -P -- "$1"; }

if [ -e ${HOME}/.backup/backup.sh ]; then
    alias bborg="${HOME}/.backup/backup.sh"
fi

if [ -e /usr/local/bin/brew ]; then
    alias tree='/usr/local/bin/tree -C'

    alias exa='/usr/local/bin/exa --long --header --group --all --git --time-style=long-iso'
    alias exa-tree='exa --tree --level=2'
    alias exa-node='exa --tree --level=5 --git-ignore --ignore-glob="*node_modules*" --ignore-glob="*.git*"'
fi

if [ "$(which docker | cut -d" " -f1)" != "" ]; then
    # web server for the active folder
    alias server-8080='/usr/local/bin/docker run --rm -v $PWD:/usr/share/nginx/html:ro -p 8080:80 nginx'
fi

# load macos alias if it is a mac
if [ "${OSTYPE:0:6}" = "darwin" ]; then
    alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
    alias fileMerge='open /Applications/Xcode.app/Contents/Applications/FileMerge.app'

    # Show/hide hidden files in Finder
    alias showDotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hideDotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

    # Hide/show all desktop icons (useful when presenting)
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

    if [ -e "/Applications/Visual Studio Code.app" ]; then
        # Add Visual Studio Code (code)
        ln -sf /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $DOTS/bin/code
    fi
    if [ -e "/Applications/Google\ Chrome.app" ]; then
        alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    fi
    if [ -e "/Applications/Google\ Chrome\ Canary.app" ]; then
        # Add Visual Studio Code (code)
        alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
    fi
fi

# added special kubernetes scripts, if kubernetes is installed
if [ "$(which kubectl | cut -d" " -f1)" != "" ]; then
    # source: https://github.com/ahmetb/kubectx
    _comdefKubens () {
        _arguments "1: :($(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}'))"
    }

    _comdefKubectx () {
        _arguments "1: :($(kubectl config get-contexts --output='name'))"
    }

    compdef _comdefKubens kubens kns=kubens
    compdef _comdefKubectx kubectx ktx=kubectx

    # alias
    alias kns='kubens'
    alias ktx='kubectx'
fi

if [ -e "$HOME/.zshrc_post.zsh" ]; then
    source $HOME/.zshrc_post.zsh
fi
