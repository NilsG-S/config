" # VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'

    " ## File Types

        " ### Markdown
        " required for vim-markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'

        " ### Python
        " still doesn't support virtualenv
        Plug 'davidhalter/jedi-vim'

    " ## Colors
    Plug 'morhetz/gruvbox'

" Automatically executes:
" - `filetype plugin indent on`
" - `syntax enable`
call plug#end()

    " ## Plugin Configuration

        " ### vim-markdown
        let g:vim_markdown_folding_disabled = 1

" # UI
set number
let python_highlight_all=1
set background=dark
colorscheme gruvbox

" # Editor
set tabstop=4
set softtabstop=4
set expandtab
set textwidth=79
set autoindent
set fileformat=unix
set encoding=utf-8

" # Mapping
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" # Settings
set updatetime=4000
