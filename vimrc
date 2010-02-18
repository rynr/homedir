" Install the following plugins:
" Rubytest.vim http://www.vim.org/scripts/script.php?script_id=2612
" rails.vim    http://www.vim.org/scripts/script.php?script_id=1567
" fugitive.vim http://www.vim.org/scripts/script.php?script_id=2975

set nocompatible             " using vim-style
set noerrorbells             " i don't like beeps
set expandtab                " i don't like tabs

set background=dark          " i prefer dark background
set cpoptions=aABcsmq        " some options
syntax on                    " syntax highlighting on
filetype plugin indent on    " load filetype plugins/indent

set fileformats=unix         " i don't care about dos or mac
set showmatch                " show matching brackets
set incsearch                " highlite searchresults while typing

set laststatus=2             " always show the status line
set ruler                    " show position in status line
                             " formatting of status line:
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%02v]

set list                     " highlite tabs
set listchars=tab:>-,trail:- " show tabs like >---

match DiffAdd '\%>80v.*'