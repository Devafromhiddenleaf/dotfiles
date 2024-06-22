let mapleader = " "
nnoremap <leader>e :Vex<CR>

inoremap jj <Esc>
"nmap <C-S-i> ggVG=
nnoremap <C-S-i> ggVG<Plug>(coc-format-selected)

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-p> :GFiles<CR>


set scrolloff=8
set number
set rnu

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
colorscheme desert

function! VimplugInstaller()
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endfunction

call VimplugInstaller()




call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/preservim/tagbar.git'
Plug 'vim-php/phpctags', {'for':'php'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'jwalton512/vim-blade'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'beanworks/vim-phpfmt'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


"===[vim-phpfmt]==="
let g:phpfmt_standard = 'PSR2'
let g:phpfmt_autosave = 1




"===[Coc.nvim]==="
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"

" Enhanced <CR> for pairs
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Disable < expansion for pairs
autocmd FileType * let b:coc_pairs_disabled = ["<"]

"===[ Coc-Explorer ]==="
" set up coc-explorer to open in the current directory
let g:coc_explorer_global_mirror = 0
let g:coc_explorer_disable_default_keybindings = 1
let g:coc_explorer_global_root = 'current'
nnoremap <space>e <Cmd>CocCommand explorer<CR>

"===[ Coc Global Extensions ]==="
let g:coc_global_extensions = [
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-pairs',
      \ 'coc-emmet',
      \ 'coc-explorer',
      \ 'coc-phpactor',
      \ 'coc-blade'
      \ ]

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" List code actions available for the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Formatting selected code
vmap <leader>f  <Plug>(coc-format-selected)

" coc-pairs
" disable characters for a specified filetypes
autocmd FileType markdown let b:coc_pairs_disabled = ['txt']





"===[ SNIPPETS ]==="
"Use Ctrl j key to trigger the snippets, default was TAB but that conflicts with
"The Completion trigger see :h keycodes to change this to sth else 
"Use Ctrl j and k to move visually within the snippet that was just triggered
"Ctrl l lists the available snippets
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:copypath_copy_to_unnamed_register = 1





"===[ Theme ]==="
set background=dark
" Inspect $TERM instead of t_Co
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let &t_TI = ""
    let &t_TE = ""
    set termguicolors
    set mouse=a
    colorscheme catppuccin_mocha
  endif
else
  colorscheme catppuccin_mocha
  let &t_TI = ""
  let &t_TE = ""
endif

if has('gui_running')
  set mouse=a
  set guicursor+=a:blinkon0
  set guifont=FiraCodeNerdFont\ 12
  colorscheme catppuccin_mocha
endif

"===[ Curosr Shape ]==="
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

