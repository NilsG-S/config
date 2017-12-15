" VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'morhetz/gruvbox'

call plug#end()
" Automatically executes:
" - `filetype plugin indent on`
" - `syntax enable`

" UI
set number
let python_highlight_all=1
set background=dark
colorscheme gruvbox

" Editor
set tabstop=4
set softtabstop=4
set expandtab
set textwidth=79
set autoindent
set fileformat=unix
set encoding=utf-8

" Settings
set updatetime=4000
