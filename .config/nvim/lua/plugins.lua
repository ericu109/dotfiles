-- Packer shows up in a floating window
require('packer').init({
  display = { open_fn = function()
      return require('packer.util').float({border = 'rounded'})
    end
  }
})

require('packer').startup(function(use)
  -- let packer manage itself
  use 'wbthomason/packer.nvim'

  -- color scheme like visual studio
  use 'Mofiqul/vscode.nvim'

  -- colorize hex codes and what not, mostly for css/scss
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require('colorizer').setup()]],
  }

  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Completion
  use 'hrsh7th/nvim-cmp' -- the completion plugin
  use 'hrsh7th/cmp-buffer' -- completions from the current buffer
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' --cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp' -- use lsp for completion
  use 'hrsh7th/cmp-nvim-lua'
  --
  -- snippets
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets for lots of languages

  -- autopairs (auto close (, [, {, etc.)
  use 'windwp/nvim-autopairs'

  -- spell helping via treesitter
  use {
    'lewis6991/spellsitter.nvim',
    config = function ()
      require('spellsitter').setup()
    end
  }

  use {
    'jedi2610/nvim-rooter.lua',
    config = function ()
      require('nvim-rooter').setup()
    end
  }
end)

-- Config for treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = 'maintained',
    sync_install = false,
    autoparis = {
      enable = true
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true -- this is mostly so spell doesn't mark class names and what not
    }
})
