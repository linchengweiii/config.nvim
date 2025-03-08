return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- enable mason and configure icons
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    require('mason-lspconfig').setup {
      -- list of servers for mason to install
      ensure_installed = {
        'clangd',
        'ts_ls',
        'html',
        'cssls',
        'volar',
        'unocss',
        'jsonls',
        'stylelint_lsp',
        'gopls',
        'pyright',
        'lua_ls',
      },
      automatic_installation = true,
    }

    require('mason-tool-installer').setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'black', -- python formatter
        'eslint_d',
      },
    }
  end,
}
