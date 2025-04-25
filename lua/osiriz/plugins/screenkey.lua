return {
  {
    'NStefan002/screenkey.nvim',
    version = 'v2.4.2',
    opts = {
      win_opts = {
        row = 2,
        anchor = 'NE'
      },
      display_infront = {
        'snacks*',
      },
    },
    keys = {
      { '<leader>k', function() require('screenkey').toggle() end, desc = 'Toggle Screenkey' }
    }
  }
}
