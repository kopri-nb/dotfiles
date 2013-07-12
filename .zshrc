#########################
##      kopri's        ##
##      .zshrc         ##
######################### 

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dpoggi"

#Make sure to use UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

EDITOR=vim

VIEW=lynx

alias ethtool='ethtool eth0'
alias tcpdump='sudo tcpdump -i eth0'
alias installfont='sudo fc-cache -f -v'
alias diff='colordiff'
alias c='clear'
alias e='exit'
alias cp='cp -Rv'
alias pstree++='~/scripts/pstree_color -pl'
alias serve='python -m SimpleHTTPServer 8080'
alias backup='cp filename{,.bak}'
alias weather='ctw --nometric USAZ0233'
alias nocomment='egrep -v "^\s*(#|$)"'
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
alias dirsize='du -h --max-depth=1 "$@" | sort -k 1,1hr -k 2,2f'
alias creationdate='stat -F '%D' +mtime'
alias internalip='print ${${$(LC_ALL=C /bin/ifconfig eth0)[7]}:gs/addr://}'
alias freespace='clear;echo "Drive      Size  Used  Avail Use  Mounted on";df -h|grep sd|column -t|sort && df -h --total|cut -c 1-11,17-37|tail -n1'
alias magnet-to-torrent='aria2c -q --bt-metadata-only --bt-save-metadata'
alias biggest='find -type f -printf '\''%s %p\n'\'' | sort -nr | head -n 40 | gawk "{ print \$1/1000000 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 }"'
alias tardir='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'

# Suffix alias
alias -s txt=vim
alias -s jpg=feh
alias -s png=feh

#Global Aliases
alias -g SPRUNGE='| curl -F "sprunge=<-" http://sprunge.us'

## Get your external IP.
[ -n "$(command -v curl)" ] && alias externalip='curl ifconfig.me'

## Network discovery.
[ -n "$(command -v nmap)" ] && alias network-discover='nmap -sP "192.168.1.*"'

CASE_SENSITIVE="true"

export UPDATE_ZSH_DAYS=14

# Show dem dots when waiting for compinit
COMPLETION_WAITING_DOTS="true"

# ZSH pluginz
plugins=(cp history nyan colored-man colorize compleat dircycle git github git-extras systemd vi-mode web-search)

source $ZSH/oh-my-zsh.sh

# Alt+x to insert sudo
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[x" insert-sudo

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Trying out oh my zsh color man for awhile
#Colored ManPages
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'
#export PAGER=less 

fpath=( ~/.zfunctions "${fpath[@]}" )
autoload -Uz google
autoload -Uz define
autoload -Uz find++

# Expanded Globbing
setopt extended_glob 
zmodload zsh/stat
zmodload zsh/complist
autoload zmv
autoload -Uz compinit && compinit -i
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

# Color command correction promt
autoload -U colors && colors
export SPROMPT="$fg[cyan]Correct $fg[red]%R$reset_color $fg[magenta]to $fg[green]%r?$reset_color ($fg[white]YES :: NO :: ABORT :: EDIT$fg[white])"

#Sudo password prompt
export SUDO_PROMT="[sudo] password for %u:"

export PATH=/home/kopri/scripts:/home/kopri/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/local/games:/usr/games

dircolors=$HOME/.dircolors-$(tput colors)

if [[ -f $dircolors ]]; then
      eval $(dircolors -b $dircolors)
    else
          eval $(dircolors)
        fi

# Syntax Highlighting 
source /home/kopri/gitdir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kopri/scripts/live


# Apply Xresources colors to the TTY
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi
