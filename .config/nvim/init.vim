" Has most basic vim settings
" searching for stuff / switching files, etc
source $HOME/.config/nvim/vimsettings.vim
" Has all of the vim-plug stuff in it, including some setup commands
source $HOME/.config/nvim/plugins.vim

colorscheme codedark " sets the color scheme to vim-code-dark

" Trims whitespace from files
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" shortcut remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

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

autocmd Filetype vim let b:AutoPairs = {} " Disables autopairs in .vim files
autocmd BufWritePre * :call TrimWhitespace() " Auto trims whitespace on write
