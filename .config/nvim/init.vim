syntax on " Turns syntax highlighting on

" Tab/spacing stuff
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " inserts spaces instead of tabs when tab is pressed

set smartindent " Turns smart indenting on
set number " Turns line numbers on
set nowrap " allows lines to extend for unlimited columns

" ignores case in searches until a capital letter is in the search clause
set ignorecase
set smartcase

set noswapfile " turns off swap files when leaving vim without saving
set nobackup " turns off backup files before overwriting

" turn undo files on and set the directory for them
set undofile
set undodir=~/.vim/undodir

set incsearch " Highlight search results as you're searching
set termguicolors " Enables gui colors in the terminal

" Vertical line at 80 chars, and the color of that line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Show spaces and tabs as visible characters
set list
set listchars=space:•,tab:»\ 

" Turn the spell-checker on
set spell

let mapleader = " "

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree' " undo tree viewer
Plug 'tomasiser/vim-code-dark' " color scheme that looks like vs
Plug 'norcalli/nvim-colorizer.lua' " background color for hex colors
Plug 'sheerun/vim-polyglot' " large set of syntax highlighting stuff
Plug 'jiangmiao/auto-pairs' " auto pairs brackets and such

call plug#end()

colorscheme codedark " sets the color scheme to vim-code-dark

" Turn on the colorizer plugin
lua require'colorizer'.setup()

" shortcut remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Rebind the undo tree to space-u
nnoremap <leader>u :UndotreeShow <CR>

autocmd Filetype vim let b:AutoPairs = {} " Disables autopairs in .vim files
