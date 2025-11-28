return {
  {
    'nvim-treesitter/nvim-treesitter',
    main = 'nvim-treesitter.configs',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'editorconfig',
        'go',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'powershell',
        'python',
        'yaml',
      },
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['ak'] = { query = '@block.outer', desc = 'block' },
            ['ik'] = { query = '@block.inner', desc = 'inner block' },
            ['ac'] = { query = '@class.outer', desc = 'class' },
            ['ic'] = { query = '@class.inner', desc = 'inner class' },
            ['a?'] = { query = '@conditional.outer', desc = 'conditional' },
            ['i?'] = { query = '@conditional.inner', desc = 'inner conditional' },
            ['af'] = { query = '@function.outer', desc = 'function' },
            ['if'] = { query = '@function.inner', desc = 'inner function' },
            ['ao'] = { query = '@loop.outer', desc = 'loop' },
            ['io'] = { query = '@loop.inner', desc = 'inner loop' },
            ['aa'] = { query = '@parameter.outer', desc = 'argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'inner argument' },
          }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']k'] = { query = '@block.outer', desc = 'Next block start' },
            [']f'] = { query = '@function.outer', desc = 'Next function start' },
            [']a'] = { query = '@parameter.outer', desc = 'Next argument start' },
          },
          goto_next_end = {
            [']K'] = { query = '@block.outer', desc = 'Next block end' },
            [']F'] = { query = '@function.outer', desc = 'Next function end' },
            [']A'] = { query = '@parameter.outer', desc = 'Next argument end' },
          },
          goto_previous_start = {
            ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
            ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
            ['[a'] = { query = '@parameter.outer', desc = 'Previous argument start' },
          },
          goto_previous_end = {
            ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
            ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
            ['[A'] = { query = '@parameter.outer', desc = 'Previous argument end' },
          },
        },
      }
    }
  },
}
