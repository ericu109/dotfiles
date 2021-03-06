" Has most basic vim settings
source $HOME/.config/nvim/vimsettings.vim
" Has all of the vim-plug stuff in it, including some setup commands
source $HOME/.config/nvim/plugins.vim

colorscheme codedark " sets the color scheme to vim-code-dark
highlight CocHighlightText  guibg=#343a40

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

nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>

" open the file explorer as a left bar
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" remap ctrl-backspace to delete word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" Ctrl-a is select all in visual mode
map <C-a> <esc>ggVG<CR>

autocmd BufWritePre * :call TrimWhitespace() " Auto trims whitespace on write
