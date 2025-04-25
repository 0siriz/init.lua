return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'VeryLazy' },
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelte = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelte = { text = '▎' },
      },
      signcolumn = true,
      sign_priority = 100,
      numhl = false,
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
        end

        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, 'Next Hunk')

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, 'Previous Hunk')

        map('n', ']H', function() gitsigns.nav_hunk('last') end, 'Last Hunk')
        map('n', '[H', function() gitsigns.nav_hunk('first') end, 'First Hunk')
        map('n', '<leader>gs', gitsigns.stage_hunk, 'Git Stage Hunk')
        map('v', '<leader>gs', function() gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, 'Git Stage Hunk')
        map('n', '<leader>gS', gitsigns.stage_buffer, 'Git Stage Buffer')
        map('n', '<leader>gr', gitsigns.reset_hunk, 'Git Reset Hunk')
        map('v', '<leader>gr', function() gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, 'Git Reset Hunk')
        map('n', '<leader>gR', gitsigns.reset_buffer, 'Git Reset Buffer')
        map('n', '<leader>gp', gitsigns.preview_hunk_inline, 'Git Preview Hunk')
        map('n', '<leader>gb', function() gitsigns.blame_line({ full = true }) end, 'Git Blame Line')
        map('n', '<leader>gB', function() gitsigns.blame() end, 'Git Blame Buffer')
        map('n', '<leader>gd', gitsigns.diffthis, 'Git Diff This')
        map('n', '<leader>gD', function() gitsigns.diffthis('~') end, 'Git Diff This ~')

      end,
    }
  },
}
