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

require('autocommands')

vim.cmd('colorscheme tokyonight-night') -- Set the colorscheme

