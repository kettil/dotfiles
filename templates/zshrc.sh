# path to .dotfiles folder
export DOTS=$HOME/.dotfiles

export TERM="xterm-256color"

# dotfiles bin folder
export PATH=$DOTS/bin:$PATH

# list of oh-my-zsh plugins
plugins=(git docker npm)

if [ -e /usr/local/bin/brew ]; then
    plugins+=(brew)
fi

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status disk_usage time)

# line options
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "

# disk options
POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95

if [ -e "$HOME/.zshrc_pre.zsh" ]; then
    source $HOME/.zshrc_pre.zsh
fi

source $DOTS/zshrc_oh-my-zsh.sh

if [ -e "$HOME/.zshrc_post.zsh" ]; then
    source $HOME/.zshrc_post.zsh
fi
