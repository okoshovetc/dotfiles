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

ssh-add -k
ssh-add -k ~/.ssh/gitlab.rsa

PATH=$PATH:~/.PATH
PATH=/usr/local/openresty/bin:$PATH
EDITOR='vim'

set -o vi

export PS1
export PATH
export TERM
export EDITOR
export PERL5LIB=~/.perl
export PERLLIB=~/.perl
export GOPATH=~/.go
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
source /home/okoshovets/perl5/perlbrew/etc/bashrc

PATH="/home/okoshovets/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/okoshovets/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/okoshovets/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/okoshovets/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/okoshovets/perl5"; export PERL_MM_OPT;
