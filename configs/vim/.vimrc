" # VIM-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-syntastic/syntastic'

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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" prevents vim-go and syntastic from colliding
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

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

" # Functions
function RParenMiddleware()
  let cur_line = getline('.')
  let cur_char = cur_line[col('.') - 1]

  if cur_char == ')'
    let cur_pos = getpos('.')

    let cur_pos[2] = cur_pos[2] + 1

    call setpos('.', cur_pos)
  else
    let cur_len = strlen(cur_line)
    let cur_col = col('.') - 1
    let begin = strpart(cur_line, 0, cur_col)
    let end = strpart(cur_line, cur_col, cur_len - cur_col)

    call setline('.', begin . ')' . end)
  endif
endfunction

" # Mapping
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap ) <C-o>:call RParenMiddleware()<CR>
inoremap { {}<left>
inoremap [ []<left>

" # Settings
set updatetime=4000

