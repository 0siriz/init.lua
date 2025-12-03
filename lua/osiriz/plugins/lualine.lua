return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = '│',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { {
          'mode',
          separator = { left = '', right = '▌' },
        } },
        lualine_b = { {
          'filename',
          file_status = true,
          symbols = {
            modified = '󱙃',
            readonly = '󰌾',
          },
        }, 'branch', 'diff', 'diagnostics' },
        lualine_c = { {
          function()
            local indexes = require('marlin').num_indexes()
            if indexes == 0 then
              return ''
            end
            local cur_index = require('marlin').cur_index()
            local status = ''

            for index = 1, indexes do
              if index == cur_index then
                status = status .. ' [' .. index .. ']'
              else
                status = status .. ' ' .. index
              end
            end

            return '󰛢' .. status
          end,
          cond = function()
            return package.loaded['marlin'] ~= nil
          end
        } },
        lualine_x = {},
        lualine_y = { 'encoding', 'fileformat', 'filetype', 'progress' },
        lualine_z = { {
          'location',
          separator = { left = '▐', right = '' },
        } },
      },
    },
  },
}
