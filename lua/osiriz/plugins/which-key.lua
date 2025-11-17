return {
  {
    'folke/which-key.nvim',
    event = { 'VeryLazy' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.icons',
    },
    opts = {
      preset = 'modern',
      spec = {
        { '<leader>c', group = 'Code' },
        { '<leader>f', group = 'Find' },
        { '<leader>g', group = 'Git' },
        { '<leader>m', group = 'Marlin' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Toggle' },
      }
    },
  },
}
