return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns`
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = '[p]review git hunk' })
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr, desc = '[s]tage git hunk' })
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr, desc = '[u]ndo stage git hunk' })
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr, desc = '[u]ndo stage git hunk' })
      vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { buffer = bufnr, desc = 'git [b]lame Line' })

      -- don't override the built-in and fugitive keymaps
      vim.keymap.set({ 'n', 'v' }, ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
      vim.keymap.set({ 'n', 'v' }, '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
    end,
  },
}
