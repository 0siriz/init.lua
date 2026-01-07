return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'dockerfile',
        'editorconfig',
        'go',
        'javascript',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
      },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup()

      if opts.ensure_installed and #opts.ensure_installed > 0 then
        require('nvim-treesitter').install(opts.ensure_installed)
        for _, parser in ipairs(opts.ensure_installed) do
          local filetypes = parser
          vim.treesitter.language.register(parser, filetypes)

          vim.api.nvim_create_autocmd({ 'FileType' }, {
            pattern = filetypes,
            callback = function(event)
              vim.treesitter.start(event.buf, parser)
            end,
          })
        end
      end

      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        callback = function(event)
          local bufnr = event.buf
          local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })

          if filetype == "" then
            return
          end

          for _, filetypes in pairs(opts.ensure_installed) do
            local ft_table = type(filetypes) == 'table' and filetypes or { filetypes }
            if vim.tbl_contains(ft_table, filetype) then
              return
            end
          end

          local parser_name = vim.treesitter.language.get_lang(filetype)
          if not parser_name then
            return
          end

          local parser_configs = require('nvim-treesitter.parsers')
          if not parser_configs[parser_name] then
            return
          end

          local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

          if not parser_installed then
            require('nvim-treesitter').install({ parser_name })
          end

          parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

          if parser_installed then
            vim.treesitter.start(bufnr, parser_name)
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    lazy = false,
    opts = {},
    keys = {
      {
        'ac',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'class',
      },
      {
        'ic',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'inner class',
      },
      {
        'af',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'function',
      },
      {
        'if',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'inner function',
      },
      {
        'ao',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@loop.outer', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'loop',
      },
      {
        'io',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@loop.inner', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'inner loop',
      },
      {
        'aa',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'argument',
      },
      {
        'ia',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'inner argument',
      },
      {
        ']c',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer')
        end,
        mode = { 'n' },
        desc = 'Next class start',
      },
      {
        ']f',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer')
        end,
        mode = { 'n' },
        desc = 'Next function start',
      },
      {
        ']a',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.outer')
        end,
        mode = { 'n' },
        desc = 'Next argument start',
      },
      {
        ']C',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer')
        end,
        mode = { 'n' },
        desc = 'Next class end',
      },
      {
        ']F',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer')
        end,
        mode = { 'n' },
        desc = 'Next function end',
      },
      {
        ']A',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@parameter.outer')
        end,
        mode = { 'n' },
        desc = 'Next argument end',
      },
      {
        '[c',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer')
        end,
        mode = { 'n' },
        desc = 'Previous class start',
      },
      {
        '[f',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer')
        end,
        mode = { 'n' },
        desc = 'Previous function start',
      },
      {
        '[a',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.outer')
        end,
        mode = { 'n' },
        desc = 'Previous argument start',
      },
      {
        '[C',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer')
        end,
        mode = { 'n' },
        desc = 'Previous class end',
      },
      {
        '[F',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer')
        end,
        mode = { 'n' },
        desc = 'Previous function end',
      },
      {
        '[A',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@parameter.outer')
        end,
        mode = { 'n' },
        desc = 'Previous argument end',
      },
    },
  },
}
