return {
  {
    'folke/which-key.nvim',
    event = { 'VeryLazy' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.icons',
    },
    opts = {
      spec = {
        { '<leader>f', group = 'Find' },
        { '<leader>s', group = 'Search' },
        { '<leader>g', group = 'Git' },
        { '<leader>c', group = 'Code' },
        { '<leader>r', group = 'Rename' },
        { '<leader>t', group = 'Toggle' },
      }
    },
  },
}
