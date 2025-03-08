return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason-lspconfig.nvim',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim',                   opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require 'lspconfig'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        local set_keymap = function(mode, key, action, desc)
          vim.keymap.set(mode, key, action, { buffer = ev.buf, desc = desc, silent = true })
        end

        set_keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        set_keymap('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        set_keymap('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        set_keymap('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        set_keymap('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- See `:help K` for why this keymap
        set_keymap('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        set_keymap('n', 'J', vim.lsp.buf.signature_help, 'Signature Documentation')
        set_keymap('n', 'H', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {}, nil)
        end, 'Toogle Inlay [H]ints')

        set_keymap('n', '<leader>rs', ':LspRestart<CR>', '[R]e[s]tart LSP')
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    require('mason-lspconfig').setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ['stylelint_lsp'] = function()
        require('lspconfig').stylelint_lsp.setup {
          capabilities = capabilities,
          filetypes = { 'css', 'scss', 'less', 'postcss', 'vue' },
        }
      end,
      ['ts_ls'] = function()
        local vue_language_server_path = require('mason-registry').get_package('vue-language-server'):get_install_path() ..
        '/node_modules/@vue/language-server'
        require('lspconfig').ts_ls.setup {
          capabilities = capabilities,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'none',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
          filetypes = { 'javascript', 'typescript', 'vue' },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'javascript', 'typescript', 'vue' },
              },
            },
          },
        }
      end,
      ['lua_ls'] = function()
        -- configure lua server (with special settings)
        lspconfig['lua_ls'].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { 'vim' },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        }
      end,
    }
  end,
}
