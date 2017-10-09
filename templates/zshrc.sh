# path to .dotfiles folder
export DOTS=$HOME/.dotfiles

# dotfiles bin folder
export PATH=$DOTS/bin:$PATH

# list of oh-my-zsh plugins
plugins=(git docker npm)

if [ ! -e /usr/local/bin/brew ]; then
    plugins+=(brew)
fi

ZSH_THEME="powerlevel9k/powerlevel9k"

if [ -e "$HOME/.zshrc_pre.zsh" ]; then
    source $HOME/.zshrc_pre.zsh
fi

source $DOTS/zshrc_oh-my-zsh.sh

if [ -e "$HOME/.zshrc_post.zsh" ]; then
    source $HOME/.zshrc_post.zsh
fi
