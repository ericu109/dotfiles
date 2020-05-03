call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree' " undo tree viewer
Plug 'tomasiser/vim-code-dark' " color scheme that looks like vs
Plug 'norcalli/nvim-colorizer.lua' " background color for hex colors
Plug 'sheerun/vim-polyglot' " large set of syntax highlighting stuff
Plug 'jiangmiao/auto-pairs' " auto pairs brackets and such
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Turn on the colorizer plugin
lua require'colorizer'.setup()
