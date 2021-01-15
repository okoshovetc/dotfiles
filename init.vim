if has('nvim')
	" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
	" set guicursor=
	set wildmode=list:full
end

let $VIM_PATH = "~/.vim/"
if has('nvim')
	let $VIM_PATH = "~/.config/nvim/"
end

call plug#begin($VIM_PATH . "plugged")
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'vim-scripts/gtags.vim'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'fatih/vim-go'
	"colorschemes
	Plug 'fsrc/lyla-vim'
	Plug 'morhetz/gruvbox'
	Plug 'https://gitlab.com/okoshovets/yvcs.git'
	" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

	Plug 'teal-language/vim-teal'
call plug#end()

let $NVIM_COC_LOG_LEVEL = 'debug'

"--------------------------------
"-- PLUGIN BINDINGS AND TUNING --
"--------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_lua_checkers = ["luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"


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
"colorscheme yvcs

" if no colorscheme chosen I do not want to see
" default ugly folded text and cursorline
hi Folded ctermfg=none ctermbg=none cterm=none"
hi CursorLine cterm=bold"

"nice tool to trace tabs and eols
set listchars=tab:\|\.,trail:.
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

"change moves do not affect my "register
nnoremap c "_c
nnoremap C "_C

"folding
set foldmethod=indent

"recursive search when :find is used
set path+=**

"fileencodings to use
set fileencodings=utf8,cp1251

"allowing pipelines in grep
set grepprg=grep\ -nI\ $*

"workflow with system clipboard via ssh
" vnoremap <C-c> :w !~/dotfiles/xssh/xsend <CR><CR>

"this is promissing to fix problem with cyrillic
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"trying out leader workflow
let mapleader=" "
nmap <Leader><Space> :lclose<CR>:cclose<CR>zz
nmap <Leader>w <C-w><C-w>
nmap <Leader>n :cnext<CR>zO
nmap <Leader>p :cprevious<CR>zO

"completion
set completeopt=longest,menuone

"augroup go
"	autocmd!
"
"	" Show by default 4 spaces for a tab
"	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
"
"	" Check syntax on write
"	autocmd BufWritePost *.go GoBuild
"
"	" :GoBuild and :GoTestCompile
"	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"
"	" :GoTest
"	autocmd FileType go nmap <leader>t  <Plug>(go-test)
"
"	" :GoRun
"	"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"
"	" :GoCoverageToggle
"	autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
"
"	" :GoInfo
"	autocmd FileType go nmap <Leader>w <Plug>(go-info)
"
"	" :GoMetaLinter
"	autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
"
"	" :GoDef but opens in a vertical split
"	" autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
"	" :GoDef but opens in a horizontal split
"	" autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
"
"	" :GoAlternate  commands :A, :AV, :AS and :AT
"	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"augroup END

" go-vim
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_metalinter_command='golangci-lint'

" fix folds on write
let g:go_fmt_experimental = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 0
let g:go_gopls_enabled = 0

" set clipboard+=unnamedplus
" let g:loaded_clipboard_provider = 1

set splitright

nmap <leader>v  <C-w>v<Plug>(coc-definition)
nmap <leader>i  <C-w>v<C-w>T<Plug>(coc-definition)
nmap <leader>d  <Plug>(coc-definition)
nmap <leader>a  <Plug>(coc-implementation)
nmap <leader>u  <Plug>(coc-references)
nmap <leader>r  <Plug>(coc-rename)
nmap <leader>e  <Plug>(go-run)

imap <C-Space> <Esc>
