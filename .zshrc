#########################
##      kopri's        ##
##      .zshrc         ##
######################### 

ZSH=$HOME/.oh-my-zsh

EDITOR=vim

VIEW=lynx

export PATH=/home/kopri/scripts:/home/kopri/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/local/games:/usr/games

source /home/kopri/.zsh/aliases
source $ZSH/oh-my-zsh.sh
source /home/kopri/.zsh/settings
source /home/kopri/.zsh/binds
source /home/kopri/.zsh/globbing
source /home/kopri/.zsh/completion
source /home/kopri/.zsh/zle

# Promt
source /home/kopri/.zsh/promt
source /home/kopri/.zsh/correctionpromt
source /home/kopri/.zsh/sudopromt

# Plugins
source /home/kopri/.zsh/plugins/colorman
source /home/kopri/.zsh/plugins/nyan
source /home/kopri/.zsh/plugins/colorize
source /home/kopri/.zsh/plugins/gitextras
source /home/kopri/.zsh/plugins/vi-mode
source /home/kopri/.zsh/plugins/git/git.plugin.zsh
source /home/kopri/.zsh/plugins/ttycolors
# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root) 
source /home/kopri/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kopri/scripts/live

# Functions
fpath=( /home/kopri/.zsh/functions "${fpath[@]}" )
autoload -Uz define
autoload -Uz find++
autoload -Uz extract
autoload -Uz history

