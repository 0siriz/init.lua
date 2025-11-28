return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-cmdline',
      'lukas-reineke/cmp-under-comparator',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      require('luasnip.loaders.from_vscode').lazy_load()

      local mapping = {
        ['<CR>'] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
              })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              })
            else
              fallback()
            end
          end,
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's', 'c' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's', 'c' }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-b>'] = cmp.mapping({
          i = cmp.mapping.scroll_docs(-4),
        }),
        ['<C-f>'] = cmp.mapping({
          i = cmp.mapping.scroll_docs(4),
        }),
      }

      local kind_icons = {
        Text = '',
        Method = '󰆧',
        Function = '󰊕',
        Constructor = '',
        Field = '󰇽',
        Variable = '󰂡',
        Class = '󰠱',
        Interface = '',
        Module = '',
        Property = '󰜢',
        Unit = '',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰏿',
        Struct = '',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '󰅲',
      }

      local menu_sources = {
        nvim_lsp = 'LSP',
        luasnip = 'LuaSnip',
        nvim_lsp_signature_help = 'Signature'
      }

      cmp.setup({
        sources = {
          { name = 'lazydev',                group_index = 0 },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require('cmp-under-comparator').under,
            cmp.config.compare.kind,
          },
        },
        mapping = mapping,
        formatting = {
          fields = { 'abbr', 'icon', 'kind', 'menu' },
          format = function(entry, vim_item)
            -- Icon
            vim_item.icon = kind_icons[vim_item.kind]

            -- Menu
            vim_item.menu = string.format('[%s]', menu_sources[entry.source.name] or entry.source.name)

            return vim_item
          end,
        },
        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' },
        },
        preselect = 'None',
      })
      cmp.setup.cmdline(':', {
        sources = {
          { name = 'async_path' },
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          },
        },
        mapping = mapping,
        formatting = {
          fields = { 'abbr' },
        },
      })

      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })
    end,
  },
}
