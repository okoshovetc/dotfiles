unpack_bash:
	cp .bashrc .bash_aliases .ps1 .tmux.conf .megatmux.conf .vimrc .inputrc .ctags .screenrc ..
	cp -r .PATH ..
	cp -r .vim ..
	cp init.vim ~/.config/nvim/
	cp init.vim ~/.vimrc
	cp -r .vim/autoload/ ~/.config/nvim/

unpack_i3:
	@echo UNIMPLEMENTED
