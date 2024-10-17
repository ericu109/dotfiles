-- remap space to nop, as it will be used as the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- set the leader key to space
vim.g.mapleader = ' '

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

-- vim.api.nvim_create_autocmd({'BufWritePre'}, {
--   pattern = {'*'},
--   callback = function()
--     format()
--     vim.cmd.write()
--   end
-- })

function format()
  local prettierFilesTypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
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
