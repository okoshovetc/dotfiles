if has('nvim')
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
	set guicursor=
end

let $VIM_PATH = "~/.vim/"
if has('nvim')
	let $VIM_PATH = "~/.config/nvim/"
end

call plug#begin($VIM_PATH . "plugged")
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'vim-scripts/gtags.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
	"colorschemes
	Plug 'fsrc/lyla-vim'
	Plug 'morhetz/gruvbox'
	Plug 'https://gitlab.com/okoshovets/yvcs.git'
call plug#end()

"--------------------------------
"-- PLUGIN BINDINGS AND TUNING --
"--------------------------------

nmap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = "find . -type f -not -path '*/\.git/*'"

"------------
"-- BASICS --
"------------
set nu
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch
set incsearch
set showmatch
set laststatus=2
set lazyredraw
set cursorline
set showcmd


"-------------
"-- VISUALS --
"-------------

"vim non-default setting
set wildmenu

"colors
colorscheme yvpale

"nice tool to trace tabs and eols
set listchars=tab:\|.,trail:.
set list

"statusline config
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'readonly', 'filename' ] ],
	\ },
	\ 'component_function': {
	\   'filename': 'LightlineFilename',
	\ },
	\ }

function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

"------------------------
"-- MOVEMENTS AND TOOLS --
"------------------------

"basic movement mappings
nmap <C-k> kzz
nmap <C-j> jzz
nmap <A-k> zkzz
nmap <A-j> zjzz

"mappings for tabs
"no mapping for tabnew because idk
nmap <F2> :tabprevious<CR>
nmap <F3> :tabnext<CR>
nmap <F4> :tabclose<CR>
nmap <F5> <C-w><C-]>
nmap <F6> <C-w><C-]><C-w>T
nmap gb gT
nmap gm `

"mappings for terminal
if has('nvim')
	tnoremap <C-q> <C-\><C-N>
	tnoremap <A-q> <C-\><C-N>
	tnoremap <A-j> <C-\><C-N>gT
	tnoremap <A-k> <C-\><C-N>gt
end

"folding
set foldmethod=indent

"recursive search when :find is used
set path+=**

"fileencodings to use
set fileencodings=utf8,cp1251

"workflow with system clipboard via ssh
vnoremap <C-c> :w !~/dotfiles/xssh/xsend <CR><CR>

"this is promissing to fix problem with cyrillic
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"commands to launch prepared scripts
command! E1 w | exec "! clear && " . $VIM_PATH . "prepared_scripts/1.sh"
command! E2 w | exec "! clear && " . $VIM_PATH . "prepared_scripts/2.sh"
command! E3 w | exec "! clear && " . $VIM_PATH . "prepared_scripts/3.sh"
command! E4 w | exec "! clear && " . $VIM_PATH . "prepared_scripts/4.sh"
command! E5 w | exec "! clear && " . $VIM_PATH . "prepared_scripts/5.sh"
