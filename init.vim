" globals
set nocompatible " no old vi

" editor look
syntax on " syntax highlighting
set number " add line numbers
set cursorline

" lua plugins
lua require('plugins')

" indentation 
" set tabstop=4 " number of columns occupied by a tab
" set softtabstop=4 " see multiple spaces as tabstops
" set expandtab " converts tabs to whitespaces
" set shiftwidth=4 " width for autoindents
set autoindent " indent newline same as the previous

" set cc=80 " set an 80 column border
set mouse=a

