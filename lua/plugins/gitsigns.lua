return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns`
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = '[p]review git hunk' })
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr, desc = 'git [s]tage hunk' })
      vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr, desc = 'git [S]tage current buffer' })
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr, desc = '[u]ndo git stage hunk' })
      vim.keymap.set('n', '<leader>hU', gs.reset_buffer_index, { buffer = bufnr, desc = 'git [U]nstage current buffer'})
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr, desc = 'git [r]eset hunk' })
      vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr, desc = 'git [R]eset buffer' })
      vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { buffer = bufnr, desc = 'git [b]lame Line' })
      vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = 'git [s]tage hunk' })
      vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = 'git [r]eset hunk' })

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
