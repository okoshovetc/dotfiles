call plug#begin()
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'kien/ctrlp.vim'
	"colorschemes
	Plug 'Haron-Prime/evening_vim'
	Plug 'liuchengxu/space-vim-dark'
	Plug 'smancill/darkglass'
	Plug 'fsrc/lyla-vim'
	Plug 'raphamorim/lucario'
call plug#end()

set nocompatible
filetype plugin on

"mappings for tabs
"no mapping for tabnew because idk
nmap <F2> :tabprevious<CR>
nmap <F3> :tabnext<CR>
nmap <F4> :tabclose<CR>
nmap <F5> <C-w><C-]>
nmap <F6> <C-w><C-]><C-w>T

"mappings for arrow keys
"map <up> :echo 'HEXOPOWO ATATA'<CR>
"map <down> :echo 'HEXOPOWO ATATA'<CR>
"map <right> :echo 'HEXOPOWO ATATA'<CR>
"map <left> :echo 'HEXOPOWO ATATA'<CR>
"
"imap <up> <ESC> :echo 'HEXOPOWO ATATA'<CR>
"imap <down> <ESC> :echo 'HEXOPOWO ATATA'<CR>
"imap <right> <ESC> :echo 'HEXOPOWO ATATA'<CR>
"imap <left> <ESC> :echo 'HEXOPOWO ATATA'<CR>

set laststatus=2
set statusline=%f
set lazyredraw
set cursorline
set showcmd

"makes vim use bash aliases
set shellcmdflag=-c

"recursive search when :find is used
set path+=**

"nice tab completion variant highlighter
set wildmenu

"numbers, tabstops and search
set nu
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch
set incsearch
set showmatch

"nice tool to trace tabs and eols
set listchars=eol:┐,tab:>.
set list

"fileencodings to use
set fileencodings=utf8,cp1251

"colors and stuff
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
colorscheme space-vim-dark
set background=dark
set background=light

"commands
command! Checkout silent exec "!git checkout \"%\"" | e! | redraw
command! GitAdd w | silent exec "!git add \"%\"" | redraw
command! GitDiff exec "! git diff \"%\""
