return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  opts = { style = 'warmer' },
  config = function(_, opts)
    require('onedark').setup(opts)
    require('onedark').load()
  end,
}
