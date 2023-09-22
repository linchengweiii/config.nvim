return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-file-browser.nvim',
  },
  opts = function()
    return {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
          n = {
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          }
        },
        layout_config = {
          preview_cutoff = 150
        }
      },
    }
  end,
  config = function(_, opts)
    require('telescope').setup(opts)

    require('telescope').load_extension 'file_browser'

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
