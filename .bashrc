TERM="xterm-256color"

#load aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

[ -f ~/.bash_functions ] && . ~/.bash_functions

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

PS1='>'

if [ -f ~/.ps1 ]; then
	. ~/.ps1
fi

# # TODO remove 2>/dev/null and fix the problem with failing to connect to auth agent
# if [ 0 == "$(ssh-add -l 2>/dev/null | grep -vc 'no identities')" ]; then
# 	ssh-add -k 2>/dev/null
# 	ssh-add -k ~/.ssh/gitlab.rsa 2>/dev/null
# fi

PATH=$PATH:~/.PATH
PATH=/usr/local/openresty/bin:$PATH
EDITOR='vim'
if [ 1 == "$(which nvim | wc -l)" ]; then
	EDITOR='nvim'
fi

set -o vi

export PS1
export PATH
export TERM
export EDITOR
export GOPATH=~/.go
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PATH="${PATH}:$GOPATH/bin"
export PATH="$PATH"

export SSDB_DEBUG=

export PYTHONSTARTUP=~/.pythonrc
