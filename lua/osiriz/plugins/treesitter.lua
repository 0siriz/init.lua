return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      parsers = {
        'bash',
        'zsh',
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

      for _, parser in ipairs(opts.parsers) do
        require('nvim-treesitter').install(parser)
      end

      local patterns = {}
      for _, parser in ipairs(opts.parsers) do
        local parser_patterns = vim.treesitter.language.get_filetypes(parser)
        for _, pp in pairs(parser_patterns) do
          table.insert(patterns, pp)
        end
      end

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = patterns,
        callback = function()
          vim.treesitter.start()
        end
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
        'am',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
        end,
        mode = { 'x', 'o' },
        desc = 'function',
      },
      {
        'im',
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
          require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next class start',
      },
      {
        ']m',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next function start',
      },
      {
        ']o',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@loop.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next loop start',
      },
      {
        ']a',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next argument start',
      },
      {
        ']C',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next class end',
      },
      {
        ']M',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next function end',
      },
      {
        ']O',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@loop.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next loop end',
      },
      {
        ']A',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@parameter.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Next argument end',
      },
      {
        '[c',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous class start',
      },
      {
        '[m',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous function start',
      },
      {
        '[o',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@loop.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous loop start',
      },
      {
        '[a',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous argument start',
      },
      {
        '[C',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous class end',
      },
      {
        '[F',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous function end',
      },
      {
        '[O',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@loop.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous loop end',
      },
      {
        '[A',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@parameter.outer', 'textobjects')
        end,
        mode = { 'n' },
        desc = 'Previous argument end',
      },
    },
  },
}
