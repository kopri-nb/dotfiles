# {{{ Title stuffs
precmd() {

	vcs_info
	setprompt

	case $TERM in
		rxvt-256color | screen-256color ) 
			print -Pn "\e]0;%n@%m: %~\a" ;;
	esac
}

preexec() {
	case $TERM in
		rxvt-256color | screen-256color )
			print -Pn "\e]0;$1\a" ;;
	esac
} 