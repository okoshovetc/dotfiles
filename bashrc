TERM="screen-256color"

#load aliases 
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash 
fi

#colors
GREEN="\[$(tput setaf 47)\]"
RED="\[$(tput setaf 160)\]"
YELLOW="\[$(tput setaf 226)\]"
BLUE="\[$(tput setaf 27)\]"
VIOLET="\[$(tput setaf 129)\]"
LIGHT_BLUE="\[$(tput setaf 51)\]"
ORANGE="\[$(tput setaf 202)\]"
PINK="\[$(tput setaf 199)\]"
WHITE="\[$(tput setaf 255)\]"
GRAY="\[$(tput setaf 245)\]"
#styles
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

PS1=\
"${VIOLET}[\A] \
${ORANGE}${BOLD}\u${RESET}\
${RED}@${BLUE}\w\n\
${BLUE}${BOLD}>>>>${RESET}"

export PS1
export TERM
