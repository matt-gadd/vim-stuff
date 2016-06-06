set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'AlessandroYorba/Sierra'
Plugin 'luochen1990/rainbow'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/ListToggle'
Plugin 'AndrewRadev/switch.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

colorscheme sierra
let g:sierra_Twilight = 1

set shell=bash
set t_Co=256
syntax on
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
set clipboard=unnamed
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set ruler
set sw=4

autocmd BufWritePre *.*  :%s/\s\+$//e
autocmd FileType javascript syntax clear jsFuncBlock
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

let mapleader=","

let g:rainbow_active = 1

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = "⛔️"
let g:syntastic_warning_symbol = "⚠️"
let g:syntastic_style_error_symbol = "⛔️"
let g:syntastic_style_warning_symbol = "⚠️"
let g:syntastic_aggregate_errors = 1
highlight SyntasticErrorSign guifg=white guibg=red

let g:tsuquyomi_disable_quickfix = 1

let g:lt_height = 5

let g:switch_mapping = "<C-a>"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"🔒":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

vnoremap < <gv
vnoremap > >gv
nnoremap ; :
inoremap <Leader>. <C-x><C-o>
nnoremap <Leader>r :CtrlPMRU<CR>
nnoremap <C-[> :TsuquyomiGoBack<CR>
