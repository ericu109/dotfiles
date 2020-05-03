" Has most basic vim settings
source vimsettings.vim
" Has all of the vim-plug stuff in it, including some setup commands
source plugins.vim

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

autocmd Filetype vim let b:AutoPairs = {} " Disables autopairs in .vim files
autocmd BufWritePre * :call TrimWhitespace() " Auto trims whitespace on write
