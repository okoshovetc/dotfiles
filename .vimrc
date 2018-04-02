call plug#begin()
	Plug 'kien/ctrlp.vim'
	"colorschemes
	Plug 'Haron-Prime/evening_vim'
	Plug 'liuchengxu/space-vim-dark'
	Plug 'smancill/darkglass'
	Plug 'fsrc/lyla-vim'
	Plug 'raphamorim/lucario'
	Plug 'tbastos/vim-lua'
	Plug 'morhetz/gruvbox'
	Plug 'okoshovetc/yvcs'
call plug#end()

let g:ctrlp_working_path_mode = 0

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
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%c,
set lazyredraw
set cursorline
set showcmd

"folding
set foldmethod=indent

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
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\S\zs\s\+$/
set listchars=tab:>.,trail:$
set list


"fileencodings to use
set fileencodings=utf8,cp1251

"colors and stuff
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set background=dark
colorscheme yvcs

"this is promissing to fix problem with cyrillic
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"commands
command! Checkout silent exec "!git checkout \"%\"" | e! | redraw
command! GitAdd w | silent exec "!git add \"%\"" | redraw
command! GitDiff exec "! git diff \"%\""
command! WW w | silent exec "! clear && ~/_/forvim/warm.sh"
command! W  w | silent exec "! clear && ~/_/forvim/daemon.sh intapi"
command! L  w | silent exec "! clear && ~/_/forvim/daemon.sh lightning"
command! S  w | silent exec "! clear && ~/_/forvim/daemon.sh slugs"
command! B  w | silent exec "! clear && ~/_/forvim/daemon.sh cloud_billing_broker"
command! DQ w | silent exec "! clear && ~/_/forvim/daemon.sh dmrgwqueue"
command! DW w | silent exec "! clear && ~/_/forvim/daemon.sh dmrgwweb"
command! NG w | exec "! clear && ~/_/forvim/nginx.sh"
command! E1 w | exec "! clear && ~/_/forvim/1.sh"
command! E2 w | exec "! clear && ~/_/forvim/2.sh"
command! E3 w | exec "! clear && ~/_/forvim/3.sh"
command! E4 w | exec "! clear && ~/_/forvim/4.sh"
command! E5 w | exec "! clear && ~/_/forvim/5.sh"
