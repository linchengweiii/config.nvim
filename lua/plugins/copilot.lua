return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<C-l>',
        accept_word = false,
        accept_line = false,
        next = '<C-j>',
        prev = '<C-k>',
        dismiss = '<C-]>',
      },
    },
  },
  config = function(_, opts)
    require('copilot').setup(opts)
  end,
  copilot_node_command = 'node',
  server_opts_overrides = {},
}
