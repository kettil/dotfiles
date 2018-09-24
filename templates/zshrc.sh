# path to .dotfiles folder
export DOTS=$HOME/.dotfiles

export TERM="xterm-256color"

# dotfiles bin folder
export PATH=$DOTS/bin:$PATH

# list of oh-my-zsh plugins
plugins=(git npm zsh-autosuggestions zsh-syntax-highlighting)

# added special docker scripts, if docker is installed
if [ "$(which docker | cut -d" " -f1)" != "" ]; then
    plugins+=(docker)
    export PATH=$DOTS/docker-bin:$PATH

    if [ "$(which docker-compose | cut -d" " -f1)" != "" ]; then
        plugins+=(docker-compose)
    fi
fi

# homebrew settings
if [ -e /usr/local/bin/brew ]; then
    # plugins is deprecated
    #plugins+=(brew)
    export PATH=$DOTS/brew-bin:$PATH
    # disabled homebrew analytics mode
    export HOMEBREW_NO_ANALYTICS=1
fi

# load macos plugin if it is a mac
if [ "${OSTYPE:0:6}" = "darwin" ]; then
    plugins+=(osx)
fi

zstyle ':completion:*' special-dirs true

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status disk_usage command_execution_time time)

# line options
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "

# dir
POWERLEVEL9K_HOME_ICON='🌍'
POWERLEVEL9K_HOME_SUB_ICON='🌋'
POWERLEVEL9K_FOLDER_ICON='🎃'
POWERLEVEL9K_ETC_ICON='🔩'

# time
POWERLEVEL9K_TIME_FORMAT='%D{\u23F1  %H:%M:%S}'
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_BACKGROUND='black'

# execution time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=60
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

# disk options
#POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false
POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95

if [ -e "$HOME/.zshrc_pre.zsh" ]; then
    source $HOME/.zshrc_pre.zsh
fi

source $DOTS/zshrc_oh-my-zsh.sh

# alias list
alias ll='ls -lisah'

# load macos alias if it is a mac
if [ "${OSTYPE:0:6}" = "darwin" ]; then
    alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
fi

if [ -e "$HOME/.zshrc_post.zsh" ]; then
    source $HOME/.zshrc_post.zsh
fi
