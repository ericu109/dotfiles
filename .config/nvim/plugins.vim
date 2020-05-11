call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree' " undo tree viewer
Plug 'tomasiser/vim-code-dark' " color scheme that looks like vs
Plug 'norcalli/nvim-colorizer.lua' " background color for hex colors
Plug 'sheerun/vim-polyglot' " large set of syntax highlighting stuff
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'OmniSharp/omnisharp-vim'

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


""""""""""""""""""""""""""""""
" OmniSharp stuff
""""""""""""""""""""""""""""""
filetype indent plugin on
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
let g:OmniSharp_highlight_types = 3
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_typeLookupInPreview = 1
"let g:OmniSharp_want_snippet=1
set completeopt+=longest,menuone,preview

""""""""""""""""""""""""""""""
" coc stuff
""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" K shows documentation in cs files
autocmd FileType cs nnoremap <silent> K :OmniSharpDocumentation<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_snippet_next = '<tab>'
