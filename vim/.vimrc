set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set background=light
set softtabstop=4   " Sets the number of columns for a TAB
set encoding=utf8
set expandtab       " Expand TABs to spaces
set number
set nocompatible              " be iMproved, required
filetype plugin indent on                  " required
syntax on
set hidden
set backspace=indent,eol,start
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFocus<cr>
map ; :
" set the runtime path to include Vundle and initialize
let g:airline_powerline_fonts=1
set rtp+=~/.vim/bundle/Vundle.vim
set pastetoggle=<F2>
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'chriskempson/base16-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
highlight Comment cterm=italic
"if (has("termguicolors"))
"  set termguicolors
"endif
set background=dark
colorscheme base16-monokai
let g:airline_theme='deus'
