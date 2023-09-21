require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Navigator
  'christoomey/vim-tmux-navigator',

  -- Diagnostic
  'folke/trouble.nvim',

  -- Undo Tree
  'mbbill/undotree',

  -- LSP Configuration & Plugins
  require 'plugins.nvim-lspconfig',

  -- Autocompletion
  require 'plugins.nvim-cmp',

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require 'plugins.gitsigns',

  -- Useful plugin to show you pending keybinds.
  require 'plugins.which-key',

  -- Theme (One Dark)
  require 'plugins.onedark',

  -- Set lualine as statusline
  require 'plugins.lualine',

  -- Add indentation guides even on blank lines
  require 'plugins.indent-blankline',

  -- Comment
  -- "gc" to comment visual regions/lines
  require 'plugins.comment',

  -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.telescope',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',

  -- Explorer for working directory
  require 'plugins.nvim-tree',

  -- Auto-pairing brackets and others
  require 'plugins.autopairs',
  require 'plugins.nvim-surround',
}, {})
