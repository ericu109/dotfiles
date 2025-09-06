vim.o.syntax = 'on'

-- Tab/spacing stuff
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true -- inserts spaces instead of tabs when tab is pressed
vim.o.hidden = true

vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false -- allows lines to extend for unlimited columns

-- ignores case in searches until a capital letter is in the search clause
vim.o.ignorecase = true
vim.o.smartcase = true

-- don't show the banner for netrw
vim.g.netrw_banner = 0
-- open files in the current buffer
vim.g.netrw_browse_split = 4

-- turn undo files on and set the directory for them
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('~') .. '/.nvim/undo/'

vim.o.incsearch = true -- Highlight search results as you're typing
vim.o.termguicolors = true -- Enables gui colors in the terminal
vim.o.swapfile = false -- turns off swap files when leaving vim without saving
vim.o.backup = false -- turns off backup files before overwriting
vim.o.writebackup = false
vim.o.updatetime = 50 -- 50ms for cursor hold event / swap-file save, if it was enabled
vim.o.cmdheight = 2 -- gives to lines for commandline at bottom

-- Show normally not visible characters as visible
vim.opt.listchars = {
  tab = '-->',
  space = '•'
}
vim.o.list = true

-- Turn on the spell checker
vim.o.spell = true
vim.o.spelloptions = 'camel'

-- Keeps the cursor in the middle of the screen, except for the beginning and end of files
vim.o.scrolloff = 9999

-- Always show the sign column, otherwise it could shift text each time diagnostics appear or are resolved
vim.o.signcolumn = 'yes'

vim.opt.shortmess:append('c')

vim.opt.completeopt = {'menuone', 'noselect'}
