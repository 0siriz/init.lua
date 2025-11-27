return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'VeryLazy' },
    opts = {
      signs = false,
    },
    keys = {
      { ']t',         function() require('todo-comments').jump_next() end,                                   desc = 'Next todo comment' },
      { '[t',         function() require('todo-comments').jump_prev() end,                                   desc = 'Previous todo comment' },
      ---@diagnostic disable-next-line: undefined-field
      { '<leader>st', function() Snacks.picker.todo_comments() end,                                          desc = 'Todo' },
      ---@diagnostic disable-next-line: undefined-field
      { '<leader>sT', function() Snacks.picker.todo_comments({ keywords = { 'TODO', 'FIX', 'FIXME' } }) end, desc = 'Todo/Fix/Fixme' },
    },
  },
}
