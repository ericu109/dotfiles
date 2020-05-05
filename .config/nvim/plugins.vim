call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree' " undo tree viewer
Plug 'tomasiser/vim-code-dark' " color scheme that looks like vs
Plug 'norcalli/nvim-colorizer.lua' " background color for hex colors
Plug 'sheerun/vim-polyglot' " large set of syntax highlighting stuff
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Turn on the colorizer plugin
lua require'colorizer'.setup()

" Rebind the undo tree to space-u
nnoremap <leader>u :UndotreeShow <CR>

if executable('rg')
    let g:rg_derive_root='true'
endif

" For searching for files and in files
nnoremap <Leader>ps :Rg<SPACE>
" For searching for files that are tracked by git, so like, switching between
" project files and what not
nnoremap <Leader>pf :GFiles<CR>
