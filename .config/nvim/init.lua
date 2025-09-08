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
require('lsp.prettier')

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

--vim.g.vscode_style = "dark"
-- Enable italic comment
--vim.g.vscode_italic_comment = 1
--vim.cmd('colorscheme vscode') -- Set the colorscheme
--
vim.cmd('colorscheme tokyonight-night') -- Set the colorscheme

-- autocmds, TODO: replace with lua when lua autocommands are released

-- Highlights other references to whatever is under the cursor
vim.cmd([[
  augroup lsp_document_highlight
    autocmd CursorHold * silent! lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved * lua vim.lsp.buf.clear_references()
  augroup END
]])

-- Highlight yanked text after yanking (came from lazyvim config: lazyvim/config/autocmds.lua)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({timeout=600})
  end,
})

-- Shows box with signature information when inside of perens on a function call
-- Maybe with other changes, I move to the pop up way too often on accident, keymap instead
-- vim.cmd([[
--   augroup lsp_show_signature
--     autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
--   augroup END
-- ]])
vim.api.nvim_set_keymap('i', '<c-s>', ':lua vim.lsp.buf.signature_help()<CR>', {noremap=true})

-- show diagnostic information on hover
-- Also get's in the way all the time..
-- vim.cmd([[
--   augroup lsp_show_diagnostics
--     autocmd CursorHold * silent! lua vim.diagnostic.open_float()
--   augroup END
-- ]])
vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', {noremap=true})
