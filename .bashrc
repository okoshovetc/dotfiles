TERM="screen-256color"

#load aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

#colors
GREEN="\[$(tput setaf 41)\]"
RED="\[$(tput setaf 160)\]"
YELLOW="\[$(tput setaf 227)\]"
BLUE="\[$(tput setaf 33)\]"
VIOLET="\[$(tput setaf 63)\]"
LIGHT_BLUE="\[$(tput setaf 45)\]"
ORANGE="\[$(tput setaf 172)\]"
PINK="\[$(tput setaf 169)\]"
WHITE="\[$(tput setaf 255)\]"
GRAY="\[$(tput setaf 243)\]"
#styles
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

PS1=\
"${PINK}[\A] ${LIGHT_BLUE}\H \
${GREEN}${BOLD}\u${RESET}\
${ORANGE}@${BOLD}${PINK}\w\n\
${PINK}${BOLD}>>>>${RESET}"

PATH=$PATH:~/.PATH
EDITOR='vim'

set -o vi

export PS1
export TERM
export EDITOR
export LANG=en_US.UTF-8
