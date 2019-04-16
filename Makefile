unpack_bash:
	cp .bashrc .bash_aliases .ps1 .tmux.conf .megatmux.conf .inputrc .ctags .screenrc ..
	cp -r .PATH ..
	cp -r .vim ..
	mkdir -p ~/.config/nvim
	cp init.vim ~/.config/nvim/
	cp init.vim ~/.vimrc
	cp -r .vim/autoload/ ~/.config/nvim/

gen_ps1:
	bash gen_ps1.sh

unpack_i3:
	@echo UNIMPLEMENTED
