-- [[ Setting globals ]]--
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.wo.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.opt.foldmethod == 'expr' then
      vim.schedule(function()
        vim.opt.foldmethod = 'expr'
      end)
    end
  end,
})

-- [[ Setting options ]] --
-- See `:help vim.o`

vim.o.termguicolors = true

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Expand tab
vim.o.expandtab = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Split right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Enable cursorline
vim.wo.cursorline = true
