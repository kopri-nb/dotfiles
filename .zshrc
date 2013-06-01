#########################
##      kopri's        ##
##      .zshrc         ##
######################### 

# Path to your oh-my-zsh configuration. dieter dpoggi geoffgarside maran obraun tjkirch
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"


# Editor
EDITOR=vim

VIEW=w3m


#duellj or rkj
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ethtool='ethtool eth0'
alias tcpdump='sudo tcpdump -i eth0'
alias installfont='sudo fc-cache -f -v'
alias diff='colordiff'
alias c='clear'
alias pstree++='~/scripts/pstree_color -pl'
alias serve='python -m SimpleHTTPServer 8080'
alias backup='cp filename{,.bak}'
alias weather='ctw --nometric USAZ0233'
alias nocomment='egrep -v "^\s*(#|$)"'
alias screenfetch='screenfetch -D debian'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias aptclean='sudo apt-get clean'
alias screenf='screenfetch -D debian'
alias god='sudo'
alias smite='rm -rf'
alias ls='ls --color=auto'
alias l.='ls -d .* --color=auto'
alias xlx='xrdb -load ~/.Xresources'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cds='cd ~/scripts'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
alias dirsize='du -h --max-depth=1 "$@" | sort -k 1,1hr -k 2,2f'
alias creationdate='stat -F '%D' +mtime'
alias internalip='print ${${$(LC_ALL=C /sbin/ifconfig eth0)[7]}:gs/addr://}'
alias freespace='clear;echo "Drive      Size  Used  Avail Use  Mounted on";df -h|grep sd|column -t|sort && df -h --total|cut -c 1-11,17-37|tail -n1'
alias magnet-to-torrent='aria2c -q --bt-metadata-only --bt-save-metadata'
alias biggest='find -type f -printf '\''%s %p\n'\'' | sort -nr | head -n 40 | gawk "{ print \$1/1000000 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 }"'
#suffix alias
alias -s txt=nano
alias -s jpg=feh
alias -s png=feh

alias tardir='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'



## Get your external IP.
[ -n "$(command -v curl)" ] && alias externalip='curl ifconfig.me'

## Network discovery.
[ -n "$(command -v nmap)" ] && alias network-discover='nmap -sP "192.168.1.*"'


# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git debian cp history nyan)

source $ZSH/oh-my-zsh.sh

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[x" insert-sudo

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line


autoload -U tetris
zle -N tetris
bindkey ^T tetris

#Colored ManPages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export PAGER=less 

fpath=( ~/.zfunctions "${fpath[@]}" )
autoload -Uz google
autoload -Uz killit
autoload -Uz define
autoload -Uz browseman
autoload -Uz find++
autoload -Uz cdf

# Expanded Globbing
setopt extended_glob 
zmodload zsh/stat
zmodload zsh/complist
autoload zmv
autoload -U compinit && compinit
autoload -U zmv
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


### If you want zsh's completion to pick up new commands in $path automatically
### comment out the next line and un-comment the following 5 lines
# zstyle ':completion:::::' completer _complete _approximate
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}
zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

autoload -U colors && colors
export SPROMPT="$fg[cyan]Correct $fg[red]%R$reset_color $fg[magenta]to $fg[green]%r?$reset_color ($fg[blue]Yes, No, Abort, Edit$fg[white])"

# Customize to your needs...
export PATH=/home/kopri/scripts:/home/kopri/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

source /home/kopri/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kopri/.oh-my-zsh/custom/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

#run screenfetch at start
screenfetch -D debian

