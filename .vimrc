echo "Loaded .vimrc"

" ==============================
" Leader Key
" ==============================
let mapleader = " "

" ==============================
" Plugins (vim-plug)
" ==============================
call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()

" ==============================
" General Vim Settings
" ==============================
set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on

set modeline
set modelines=2
set backspace=indent,eol,start
set visualbell

" ==============================
" Display Settings
" ==============================
set number
set relativenumber
set showmode
set showcmd
set scrolloff=3
set linebreak
set listchars=tab:>-,trail:_
set list

" ==============================
" Indentation and Tabs
" ==============================
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" ==============================
" Search
" ==============================
set incsearch
set ignorecase
set smartcase
set hlsearch

" ==============================
" Clipboard and Text Behavior
" ==============================
set clipboard=unnamedplus
set textwidth=80

" ==============================
" NERDTree Settings
" ==============================
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" ==============================
" Line Navigation
" ==============================
nnoremap L $
nnoremap H ^
vnoremap L $
vnoremap H ^


" ==============================
" Miscellaneous
" ==============================
nnoremap <C-A> gg<S-v>G
autocmd BufWrite * set nobomb
