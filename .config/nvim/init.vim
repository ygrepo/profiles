set number
set relativenumber
set cursorline
set scrolloff=4
set colorcolumn=80

syntax enable

set noswapfile
set hidden

set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set smartindent
set autoindent

set incsearch
set ignorecase
set smartcase
set nohlsearch

set splitbelow
set splitright
set mouse=

set showmode
set showcmd

" -----------------------------
" Plugins
" -----------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'gruvbox-community/gruvbox'

call plug#end()

colorscheme gruvbox
