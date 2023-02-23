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
vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', {noremap = true, silent = true})

-- < or > in visual mode to move the indentation level of selected lines
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap=true, silent=true})
vim.api.nvim_set_keymap('x', 'J', ':move \'<+1<CR>gv-gv', {noremap=true, silent=true})

-- Hold on to what's in the register when pasting over something, instead of yanking what was pasted over
vim.api.nvim_set_keymap('v', 'p', '"_dP', {noremap=true, silent=true})

-- hotkey to play macros
-- vim.api.nvim_set_keymap('n', '<leader>pa', '@a', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pb', '@b', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pc', '@c', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pd', '@d', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pe', '@e', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pf', '@f', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pg', '@g', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>ph', '@h', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pi', '@i', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pj', '@j', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pk', '@k', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pl', '@l', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pm', '@m', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pn', '@n', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>po', '@o', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pp', '@p', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pq', '@q', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pr', '@r', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>ps', '@s', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pt', '@t', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pu', '@u', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pv', '@v', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pw', '@w', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>px', '@x', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>py', '@y', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>pz', '@z', {noremap=true,silent=true})
--
-- vim.api.nvim_set_keymap('n', '<leader>p0', '@0', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p1', '@1', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p2', '@2', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p3', '@3', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p4', '@4', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p5', '@5', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p6', '@6', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p7', '@7', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p8', '@8', {noremap=true,silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>p9', '@9', {noremap=true,silent=true})
