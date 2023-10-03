return {
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl.config`
  main = 'ibl',
  opts = {
    indent = {
      char = '┊',
    },
    whitespace = {
      remove_blankline_trail = false
    },
  },
}
