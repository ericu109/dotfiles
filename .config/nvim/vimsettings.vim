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

" turn undo files on and set the directory for them
set undofile
set undodir=~/.vim/undodir

set incsearch " Highlight search results as you're searching
set termguicolors " Enables gui colors in the terminal
set noswapfile " turns off swap files when leaving vim without saving
set nobackup " turns off backup files before overwriting
set updatetime=50 " 50ms for cursor hold event / swap-file save, if it was enabled.
set cmdheight=2 " gives two lines for command line at bottom

" Vertical line at 80 chars, and the color of that line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Show spaces and tabs as visible characters
set list
set listchars=space:•,tab:»\

" Turn the spell-checker on
set spell

let mapleader = " "