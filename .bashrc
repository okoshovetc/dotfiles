TERM="screen-256color"

#load aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

PS1='>'

if [ -f ~/.ps1 ]; then
	. ~/.ps1
fi


PATH=$PATH:~/.PATH
PATH=/usr/local/openresty/bin:$PATH
EDITOR='vim'

set -o vi

export PS1
export PATH
export TERM
export EDITOR
export LANG=en_US.UTF-8
export PERL5LIB=~/.perl
export PERLLIB=~/.perl
export GOPATH=~/.go
source /home/okoshovets/perl5/perlbrew/etc/bashrc
