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

-- Close any netrw buffers when entering a new buffers
-- Mostly this is to close netrw after selecting a file
vim.api.nvim_create_autocmd({'BufEnter'}, {
  callback = function(ev)
    for _, buf_id in pairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf_id].filetype == 'netrw' then
        vim.api.nvim_buf_delete(buf_id, {})
      end
    end
  end
})

-- Auto format on save
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = {'*'},
  callback = function()
    format()
    vim.cmd.write()
  end
})

-- function to switch between formatting with prettier and formatting with the lsp
function format()
  local prettierFilesTypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "htmlangular",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  }

  if has_value(prettierFilesTypes, vim.bo.filetype) then
    -- print('Formatted with Prettier')
    vim.cmd(':Prettier')
  else
    vim.lsp.buf.format({async=false})
    -- print('Formatted with vim.lsp.buf.format')
  end
end

function has_value (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end
