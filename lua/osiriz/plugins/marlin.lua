return {
  {
    'desdic/marlin.nvim',
    event = { 'VeryLazy' },
    opts = {},
    keys = {
      { '<leader>ma', function() require('marlin').add() end,        mode = { 'n' }, desc = 'Add File' },
      { '<leader>md', function() require('marlin').remove() end,     mode = { 'n' }, desc = 'Remove File' },
      { '<leader>mn', function() require('marlin').next() end,       mode = { 'n' }, desc = 'Open Next Index' },
      { '<leader>mp', function() require('marlin').prev() end,       mode = { 'n' }, desc = 'Open Previous Index' },
      { '<leader>mx', function() require('marlin').remove_all() end, mode = { 'n' }, desc = 'Remove all Files' },
      {
        '<leader>ms',
        function()
          local lookup = {}

          local function get_choices()
            local results = require('marlin').get_indexes()

            local items = {}
            lookup = {}
            for idx, b in ipairs(results) do
              local text = b.filename .. ':' .. b.row

              table.insert(items, {
                formatted = text,
                file = b.filename,
                text = text,
                idx = idx,
                pos = { tonumber(b.row), 0 }
              })

              lookup[text] = b
            end
            return items
          end

          Snacks.picker.pick({
            source = 'files',
            finder = get_choices,
            title = 'Marlin',
            actions = {
              marlin_up = function(picker, item)
                require('marlin').move_up(lookup[item.text].filename)
                picker:find({ refresh = true })
              end,
              marlin_down = function(picker, item)
                require('marlin').move_down(lookup[item.text].filename)
                picker:find({ refresh = true })
              end,
              marlin_delete = function(picker, item)
                require('marlin').remove(lookup[item.text].filename)
                picker:find({ refresh = true })
              end,
            },
            win = {
              input = {
                keys = {
                  ['<C-k>'] = { 'marlin_up', mode = { 'n', 'i' }, desc = 'Move marlin up' },
                  ['<C-j>'] = { 'marlin_down', mode = { 'n', 'i' }, desc = 'Move marlin down' },
                  ['<C-d>'] = { 'marlin_delete', mode = { 'n', 'i' }, desc = 'Marlin delete' },
                },
              },
            },
          })
        end,
        mode = { 'n' },
        desc = 'Search'
      }
    },
  },
}
