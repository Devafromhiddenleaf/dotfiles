#! /usr/bin/bash 

set nu
set rnu

"TAB settings"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set splitright
set incsearch "highlight the search"
set scrolloff=2 "leave lines above and below"
set nopaste "paste from clipbord without any change in intentation as in the source"

let mapleader = " "
"------------------------- Keybindings --------------------------"
imap jj <Esc>
imap JJ <Esc>
nnoremap <Leader>b :ls<CR>:buffer<Space>
 
" Navigation between window "
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Resizing window "
nnoremap <A-S-h> <C-w><
nnoremap <A-S-l> <C-w>>
nnoremap <A-S-j> <C-w>-
nnoremap <A-S-k> <C-w>+

" Moving window "
nnoremap <A-C-h> <C-w>H
nnoremap <A-C-l> <C-w>L
nnoremap <A-C-j> <C-w>J
nnoremap <A-C-k> <C-w>K

" Close window "
nnoremap <Leader>wc :q<Cr>

" Creating & navigating tabs "
nnoremap <Leader>tc :tabnew<Cr>
nnoremap <Leader>tq :tabclose<Cr>
nnoremap <Leader>tn :tabnext<Cr>
nnoremap <Leader>tp :tabprevious<Cr>


"------------------------- Plugins --------------------------"

"vim-plug"
call plug#begin()
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'Shougo/deoplete.nvim'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'kristijanhusak/deoplete-phpactor'
call plug#end()




"------------------------- Commands --------------------------"
"Define a function to clear the terminal and run a PHP file"
function! RunPhpFile(file)
    execute '!clear && php' a:file
endfunction

" Create a command that calls the RunPhpFile function"
command! -nargs=1 Php call RunPhpFile(<f-args>)

command! -nargs=* Php :! php <args>
command! -nargs=* Find :/\c\<<args>\>
