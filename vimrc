call plug#begin()
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'kien/ctrlp.vim' 
call plug#end()

set nocompatible
filetype plugin on

"mappings for NERDTree
nmap <C-F2> :colorscheme molokai<CR>
silent! nmap <C-n> :NERDTreeToggle<CR>

"mappings for tabs
"no mapping for tabnew because idk
nmap <F2> :tabprevious<CR>
nmap <F3> :tabnext<CR>
nmap <F4> :tabclose<CR>

"mappings for arrow keys
map <up> :echo 'HEXOPOWO ATATA'<CR>
map <down> :echo 'HEXOPOWO ATATA'<CR>
map <right> :echo 'HEXOPOWO ATATA'<CR>
map <left> :echo 'HEXOPOWO ATATA'<CR>

imap <up> <ESC> :echo 'HEXOPOWO ATATA'<CR>
imap <down> <ESC> :echo 'HEXOPOWO ATATA'<CR>
imap <right> <ESC> :echo 'HEXOPOWO ATATA'<CR>
imap <left> <ESC> :echo 'HEXOPOWO ATATA'<CR>

set laststatus=2
set statusline+=%f
set lazyredraw
set cursorline
set showcmd

"makes vim use bash aliases
set shellcmdflag=-ic

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
set listchars=eol:┐,tab:▹\ 
set list

"fileencodings to use
set fileencodings=utf8,cp1251

"colors and stuff
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
colorscheme lyla
