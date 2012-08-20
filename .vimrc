set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

autocmd BufWritePre *.php  :%s/\s\+$//e
autocmd BufWritePre *.inc  :%s/\s\+$//e
autocmd BufWritePre *.tpl  :%s/\s\+$//e
autocmd BufWritePre *.xsl  :%s/\s\+$//e
autocmd BufWritePre *.xsd  :%s/\s\+$//e
autocmd BufWritePre *.css  :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.js   :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.xml  :%s/\s\+$//e
autocmd BufWritePre *.conf :%s/\s\+$//e
autocmd BufWritePre *.csv  :%s/\s\+$//e
autocmd BufWritePre *.sql  :%s/\s\+$//e
autocmd BufWritePre *.sh   :%s/\s\+$//e

au! BufRead,BufNewFile *.json set filetype=json 

" turn matching parenthesis off
let g:loaded_matchparen=1 

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let mapleader=","
colorscheme jellybeans
syntax on
filetype plugin indent on
set encoding=utf-8
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set title
set visualbell
set noerrorbells
set novb
set list
set tabstop=4
set list listchars=tab:»·,trail:·
set ttyfast
set mouse=
set nocompatible
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set ruler

let g:Powerline_symbols = 'fancy'
" Command T mappings
let g:CommandTMaxFiles=5000
let g:CommandTMaxHeight=12
map <C-o> :CommandT<CR>
let g:CommandTAcceptSelectionMap = '<CR>'
let g:CommandTCancelMap = '<C-g>'

autocmd FileType javascript 
 \ setlocal shiftwidth=4 | 
 \ setlocal tabstop=4 | 
 \ setlocal softtabstop=4 | 
 \ setlocal expandtab


autocmd FileType json 
 \ setlocal shiftwidth=4 | 
 \ setlocal tabstop=4 | 
 \ setlocal softtabstop=4 | 
 \ setlocal expandtab

" Enable rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadBraces

" Swap window buffers.
function! SwapWindowBuffers()
    if !exists("g:markedWinNum")
        " set window marked for swap
        let g:markedWinNum = winnr()
        :echo "window marked for swap"
    else
        " mark destination
        let curNum = winnr()
        let curBuf = bufnr( "%" )
        if g:markedWinNum == curNum
            :echo "window unmarked for swap"
        else
            exe g:markedWinNum . "wincmd w"
            " switch to source and shuffle dest->source
            let markedBuf = bufnr( "%" )
            " hide and open so that we aren't prompted and keep history
            exe 'hide buf' curBuf
            " switch to dest and shuffle source->dest
            exe curNum . "wincmd w"
            " hide and open so that we aren't prompted and keep history
            exe 'hide buf' markedBuf
            :echo "windows swapped"
        endif
        " unset window marked for swap
        unlet g:markedWinNum
    endif
endfunction

" Tab key mappings
nmap <C-S-h> :tabprevious<cr>
nmap <C-l> :tabnext<cr>
map <C-S-h> :tabprevious<cr>
map <C-l> :tabnext<cr>
imap <C-S-h> <ESC>:tabprevious<cr>i
imap <C-l> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

nmap <silent> <c-n> :NERDTreeToggle<cr>
nnoremap <leader>a :Ack 
nnoremap ; :
nmap <leader>f :Ack <cword><CR>
noremap <leader>vv :vsplit<CR>
noremap <leader>ss :split<CR>
noremap <leader>w :call SwapWindowBuffers()<CR>
map <F2> :set paste<CR>
map <F3> :set nopaste<CR>
" Shift text blocks/indent shortcuts
vnoremap < <gv
vnoremap > >gv
set winminheight=0      " Allow windows to get fully squashed

"
" Switch between windows, maximizing the current window
"
map <leader>mm <C-W>_
map <leader>nn <C-W>=

filetype indent on
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'gmarik/vundle'
Bundle 'The-NERD-Commenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/JSON.vim'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'nanotech/jellybeans.vim'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

