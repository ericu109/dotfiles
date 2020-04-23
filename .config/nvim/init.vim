syntax on

set noerrorbells
set tabstop=3
set softtabstop=3
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
set termguicolors
highlight ColorColumn ctermbg=0 guibg=lightgrey

set list
set listchars=space:•

set spell

call plug#begin('~/.vim/plugged')

Plug 'mbbil/undotree'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

let mapleader = " "

colorscheme codedark

" Plugin setup stuff
lua require'colorizer'.setup()

" shortcut remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow <CR>
