return {
  {
    'ph1losof/shelter.nvim',
    lazy = false,
    opts = {
      modules = {
        files = true,
        snacks_previewer = true,
      },
    },
    keys = {
      { '<leader>hp', function() require('shelter.integrations.buffer').toggle_peek() end, desc = 'Peek' },
      { '<leader>ht', function() require('shelter').toggle('files') end,                   desc = 'Toggle' },
    },
  },
}
