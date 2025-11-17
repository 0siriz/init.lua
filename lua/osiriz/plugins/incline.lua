return {
  {
    'b0o/incline.nvim',
    event = { 'VeryLazy' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
      },
      render = function(props)
        local fullfilename = vim.api.nvim_buf_get_name(props.buf)

        local marlin_status = nil
        if package.loaded['marlin'] ~= false and require('marlin').num_indexes() ~= 0 then
          for idx, b in ipairs(require('marlin').get_indexes()) do
            if b.filename == fullfilename then
              marlin_status = '󰛢' .. idx
              break
            end
          end
        end

        local filename = vim.fn.fnamemodify(fullfilename, ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = require('nvim-web-devicons').get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local res = {
          ft_icon and
          { ' ', ft_icon, ' ', guibg = ft_color, guifg = require('incline.helpers').contrast_color(ft_color) } or '',
          ' ',
          { filename, gui = modified and 'italic' or nil },
          ' ',
          marlin_status and { marlin_status, ' ' } or '',
        }
        return res
      end,
    },
    keys = {
      { '<leader>ti', function() require('incline').toggle() end, desc = 'Toggle incline' }
    }
  },
}
