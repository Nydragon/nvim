set nocompatible
set relativenumber
set cc=80
set ignorecase
hi ColorColumn ctermbg=black guibg=black
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set completeopt=menu,menuone,noselect

filetype plugin on

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

lua require('plugins')
