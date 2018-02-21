" # VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'

    " ## File Types

        " ### Markdown
        " required for vim-markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
	
	" ### Go
	Plug 'fatih/vim-go'
	Plug 'zchee/deoplete-go', { 'do': 'make' }

    " ## Colors
    Plug 'morhetz/gruvbox'

" Automatically executes:
" - `filetype plugin indent on`
" - `syntax enable`
call plug#end()

" # Plugin Configuration

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp=1
set completeopt-=preview
set pyxversion=3
set encoding=utf-8

" NERDTree
let NERDTreeShowHidden=1
" Open automatically if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        " vim-markdown
        let g:vim_markdown_folding_disabled = 1

	" deoplete-go
	let g:deoplete#sources#go#gocode_binary='~/go/bin/gocode'
	let g:deoplete#sources#go#package_dot=0
	let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
	let g:deoplete#sources#go#pointer=0
	let g:deoplete#sources#go#cgo=0

	" vim-go
	let g:go_metalinter_autosave = 0

" # Editor
set backspace=indent,eol,start

" # UI
set number
set background=dark
colorscheme gruvbox

" # Settings
set updatetime=4000
set nocompatible
