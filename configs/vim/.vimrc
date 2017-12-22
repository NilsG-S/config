" # VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
" Requirements:
" - `sudo apt-get install build-essential cmake`
" - `sudo apt-get install python-dev python3-dev`
" - run `install.py` on YouCompleteMe with various completer options
" - Note: some languages (e.g. JavaScript) may require additional configuration
" See: https://github.com/Valloric/YouCompleteMe
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-go', { 'do': 'make' }

    " ## File Types

        " ### Markdown
        " required for vim-markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
	
	" ### Go
	Plug 'fatih/vim-go'

    " ## Colors
    Plug 'morhetz/gruvbox'

" Automatically executes:
" - `filetype plugin indent on`
" - `syntax enable`
call plug#end()

" # Plugin Configuration

" YouCompleteMe
" let g:ycm_python_binary_path = 'python'
" set completeopt-=preview

" deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
let NERDTreeShowHidden=1
" Open automatically if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        " vim-markdown
        let g:vim_markdown_folding_disabled = 1

" # UI
set number
set background=dark
colorscheme gruvbox

" # Mapping
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" # Settings
set updatetime=4000
