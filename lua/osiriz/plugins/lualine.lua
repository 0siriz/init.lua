return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { {
          function()
            local indexes = require('marlin').num_indexes()
            if indexes == 0 then
              return ''
            end
            local cur_index = require('marlin').cur_index()

            return '󰛢 ' .. cur_index .. '/' .. indexes
          end,
          cond = function()
            return package.loaded['marlin'] ~= false
          end
        } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
}
