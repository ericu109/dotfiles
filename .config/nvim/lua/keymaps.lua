-- remap space to nop, as it will be used as the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- set the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ch in normal mode to clear highlighting after searching
vim.api.nvim_set_keymap('n', 'ch', ':nohlsearch<CR>:syntax sync fromstart<CR>', {noremap = true, silent = true})

-- Create undo break points on , . ! and ?
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', {noremap = true})
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', {noremap = true})

-- shortcuts for moving between windows
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {noremap = true, silent = true})

-- open netrw as a left banner
vim.api.nvim_set_keymap('n', '<leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>', {noremap = true})

-- navigation / finding files
vim.api.nvim_set_keymap('n', '<leader>pf', '<cmd>lua require("telescope.builtin").git_files({layout_strategy="vertical",show_untracked=true,layout_config={width=0.99}})<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ps', '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical",layout_config={width=0.99}})<CR>', {noremap = true, silent = true})

-- vertical resize (width resize) for a window
vim.api.nvim_set_keymap('n', '<leader>+', ':vertical resize +10<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -10<CR>', {noremap = true})

-- remap ctrl-backspace to delete a word
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', {noremap = true})

-- ctrl-a in normal mode to go to visual mode and select all
vim.api.nvim_set_keymap('n', '<C-a>', '<esc>ggVG', {})

-- set a shortcut for opening the undo tree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true})

-- LSP/completion/formatting Keymaps
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references({layout_strategy="vertical",layout_config={width=0.99},fname_width=100})<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua require("telescope.builtin").treesitter({layout_strategy="vertical",layout_config={width=0.99}})<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua require("telescope.builtin").spell_suggest()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua format()<CR>', {noremap = true, silent = true})

-- < or > in visual mode to move the indentation level of selected lines
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap=true, silent=true})
vim.api.nvim_set_keymap('x', 'J', ':move \'<+1<CR>gv-gv', {noremap=true, silent=true})

-- Hold on to what's in the register when pasting over something, instead of yanking what was pasted over
vim.api.nvim_set_keymap('v', 'p', '"_dP', {noremap=true, silent=true})

-- flash.nvim Keymaps
vim.api.nvim_set_keymap('n', 's', '<cmd>lua require("flash").jump()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 's', '<cmd>lua require("flash").jump()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 's', '<cmd>lua require("flash").jump()<cr>', {noremap = true, silent = true})

-- snipe.nvim Keymaps
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require("snipe").open_buffer_menu()<cr>', {noremap = true, silent = true})

-- signature help, and viewing diagnostic info
vim.api.nvim_set_keymap('i', '<c-k>', '<cmd>:lua vim.lsp.buf.signature_help({focusable=false})<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>:lua vim.diagnostic.open_float()<CR>', {noremap=true})

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
    print('Formatted with Prettier')
    vim.cmd(':Prettier')
  else
    vim.lsp.buf.format({async=false})
    print('Formatted with vim.lsp.buf.format')
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
