" VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'dracula/vim'

call plug#end()
" Automatically executes:
" - `filetype plugin indent on`
" - `syntax enable`

" UI
set number
let python_highlight_all=1
color dracula

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "!",
    \ "Renamed"   : "->",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "$",
    \ "Clean"     : "%",
    \ 'Ignored'   : "_",
    \ "Unknown"   : "?"
    \ }

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
