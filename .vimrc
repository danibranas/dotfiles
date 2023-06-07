set nocompatible  " be iMproved, required
set hlsearch
filetype off      " required

" Set runtime path to Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself.
Plugin 'VundleVim/Vundle.vim'

" Plugins
" Plugin 'tomasr/molokai'
" Plugin 'vim-syntastiscrooloosec/syntastic'
Plugin 'L9'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ervandew/supertab'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/fzf.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'

" Required, plugins available after.
call vundle#end()
filetype plugin indent on

syntax on

set ai
set autoread
set backspace=indent,eol,start " Allow backspacing everything in insert mode
set colorcolumn=90
set confirm
set cursorline
set expandtab
set hidden
set history=100
set ignorecase smartcase
set incsearch hlsearch
set linebreak
set mouse=a
set number
set showcmd
set t_ti= t_te=
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set wildmenu
set wildmode=list:longest,full

"fzf autocompleter
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable completion where available
let g:ale_completion_enabled=1

" Backups config
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Thin cursor on insert mode
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif"

" Theme
set background=dark
colorscheme palenight

if (has("termguicolors"))
  set termguicolors
endif

" Italics on palenight theme
let g:palenight_terminal_italics=1

" Commands
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Silver Search (Ag)
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep'
endif

" Plugin configurations

" Vim-Javascript
let g:javascript_plugin_jsdoc = 1

" Vim-Javascript-Syntax
set statusline+=%#warningmsg#
"set statusline+=%{ALEGetStatusLine()}
set statusline+=%*

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "hybrid"
let g:enable_bold_font = 1

" NERD-Tree
set autochdir
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1
nnoremap <leader>n :NERDTree /Users/daniel/Projects/<CR>
autocmd VimEnter * NERDTree

" Encoding
set encoding=UTF-8

" CtrP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Mappings
let mapleader = ","
nnoremap <BS> :nohlsearch<CR>
nnoremap <leader>r :source ~/.vimrc<CR>
map <leader>nn :NERDTreeToggle<cr>
noremap <leader>nf :NERDTreeFind<cr>

" NERDCOmmenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
