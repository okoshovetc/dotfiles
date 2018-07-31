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
"${PINK}[\A] ${BLUE}\H \
${GREEN}${BOLD}\u${RESET}\
${ORANGE}@${BLUE}\w\n\
${PINK}${BOLD}>>>>${RESET}"
