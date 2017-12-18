" # VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
" Requirements:
" - `sudo apt-get install build-essential cmake`
" - `sudo apt-get install python-dev python3-dev`
" - run `install.py` on YouCompleteMe with various completer options
" See: https://github.com/Valloric/YouCompleteMe
Plug 'Valloric/YouCompleteMe'

    " ## File Types

        " ### Markdown
        " required for vim-markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'

    " ## Colors
    Plug 'morhetz/gruvbox'

" Automatically executes:
" - `filetype plugin indent on`
" - `syntax enable`
call plug#end()

" # Plugin Configuration

" YouCompleteMe
let g:ycm_python_binary_path = 'python'

        " vim-markdown
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
