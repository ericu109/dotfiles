require('settings')
require('plugins')
require('keymaps')

-- Configuration for the different language servers
require('lsp.lua')
require('lsp.typescript')
require('lsp.angular')
require('lsp.html')
require('lsp.json')
require('lsp.css')
require('lsp.html')
require('lsp.eslint')

-- Completion Configurations
require('comp')

-- autopairs Configuration
require('autoparis')

-- Trim white space before save
vim.cmd([[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  autocmd BufWritePre * :call TrimWhitespace()
]])

vim.g.vscode_style = "dark"
-- Enable italic comment
vim.g.vscode_italic_comment = 1
vim.cmd('colorscheme vscode') -- Set the colorscheme

-- autocmds, TODO: replace with lua when lua autocommands are released

-- Highlights other references to whatever is under the cursor
vim.cmd([[
  augroup lsp_document_highlight
    autocmd CursorHold * silent! lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved * lua vim.lsp.buf.clear_references()
  augroup END
]])
