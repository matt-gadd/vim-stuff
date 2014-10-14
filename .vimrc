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
let g:ctrlp_max_files = 0

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let mapleader=","
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
set mouse=a
set nocompatible
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set ruler
set sw=4
set suffixesadd+=.js

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

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as 
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction

nmap <silent> <c-n> :NERDTreeToggle<cr>
nnoremap <leader>a :Ack 
nnoremap ; :
nmap <leader>f :Ack <cword><CR>
noremap <leader>vv :vsplit<CR>
noremap <leader>ss :split<CR>
noremap <leader>w :call SwapWindowBuffers()<CR>
noremap <leader>r :MRU<CR>
nmap <leader> :.w !pbcopy<CR><CR>
vmap <leader> :w !pbcopy<CR><CR>
" Shift text blocks/indent shortcuts
vnoremap < <gv
vnoremap > >gv
set winminheight=0      " Allow windows to get fully squashed

"
" Switch between windows, maximizing the current window
"
map <leader>mm <C-W>_
map <leader>nn <C-W>=

let g:ctrlp_custom_ignore = '\v[\/](dojo|target|node)$'

filetype indent on
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'The-NERD-Commenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/JSON.vim'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'nanotech/jellybeans.vim'
Bundle 'hallettj/jslint.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'ConradIrwin/vim-bracketed-paste'

colorscheme jellybeans
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
