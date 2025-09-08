-- Highlight yanked text after yanking (came from lazyvim config: lazyvim/config/autocmds.lua)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({timeout=600})
  end,
})

-- autocmds, TODO: replace with lua when lua autocommands are released
-- Highlights other references to whatever is under the cursor
vim.cmd([[
  augroup lsp_document_highlight
    autocmd CursorHold * silent! lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved * lua vim.lsp.buf.clear_references()
  augroup END
]])

-- Trim white space before save
vim.cmd([[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  autocmd BufWritePre * :call TrimWhitespace()
]])
