" Install the following plugins:
" Rubytest.vim http://www.vim.org/scripts/script.php?script_id=2612
" rails.vim    http://www.vim.org/scripts/script.php?script_id=1567

set nocompatible             " using vim-style
set noerrorbells             " I don't like beeps
set expandtab                " I don't like tabs

set background=dark          " I prefer dark background
set cpoptions=aABcsmq        " some options
syntax on                    " syntax highlighting on

set fileformats=unix         " I don't care about dos or mac
set showmatch                " show matching brackets
set incsearch                " highlite searchresults while typing

set laststatus=2             " always show the status line
set ruler                    " show position in status line
                             " formatting of status line:
set statusline=%F%m%r%h%w[%L][%{&ff}]%{fugitive#statusline()}%y[%p%%][%04l,%02v]

set shiftwidth=2
set softtabstop=2
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
endif

set list                     " highlite tabs
set listchars=tab:>-,trail:- " show tabs like >---

match DiffAdd '\%>80v.*'

execute pathogen#infect()

