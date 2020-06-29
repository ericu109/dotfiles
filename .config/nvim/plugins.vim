call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree' " undo tree viewer
Plug 'tomasiser/vim-code-dark' " color scheme that looks like vs
Plug 'norcalli/nvim-colorizer.lua' " background color for hex colors
Plug 'sheerun/vim-polyglot' " large set of syntax highlighting stuff
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch':'release'}
" Plug 'OmniSharp/omnisharp-vim'
Plug 'shime/vim-livedown'

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
" For searching for files that can be tracked by git (tracked and untracked),
" switching between project files and what not (comes from fzf.vim)
nnoremap <Leader>pf :GFiles --exclude-standard --cached --others<CR>

""""""""""""""""""""""""""""""
" livedown (markdown plugin)
""""""""""""""""""""""""""""""
let g:livedown_browser = "firefox-developer-edition"

""""""""""""""""""""""""""""""
" OmniSharp stuff
""""""""""""""""""""""""""""""
" filetype indent plugin on
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_timeout = 5
" let g:OmniSharp_highlight_types = 3
" let g:omnicomplete_fetch_full_documentation = 1
" let g:OmniSharp_typeLookupInPreview = 1
"let g:OmniSharp_want_snippet=1
" set completeopt+=longest,menuone,preview

""""""""""""""""""""""""""""""
" coc stuff
""""""""""""""""""""""""""""""
" If completion menu is shown, then tab goes next option
" If it's not shown, but the item is expandable(snippet) then expand the
" snippet
" This allows for tab navigation of snippets, as well as tab completion as you
" would expect.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_pref = '<s-tab>'

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
nmap <silent> rr <Plug>(coc-rename)

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
" autocmd FileType cs nnoremap <silent> K :OmniSharpDocumentation<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" markdown server toggle
nmap gm :LivedownToggle<CR>

