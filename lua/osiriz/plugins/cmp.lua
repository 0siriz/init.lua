return {
	{
		'hrsh7th/nvim-cmp',
		event = { 'InsertEnter', 'CmdlineEnter' },
		dependencies = {
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-document-symbol',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-emoji',
			'onsails/lspkind.nvim',
			'windwp/nvim-autopairs',
		},
		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			local lspkind = require('lspkind')
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')

			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)

			require('luasnip.loaders.from_vscode').lazy_load()

			local mapping = {
				['<CR>'] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Replace,
								select = true,
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
				['<C-b>'] = cmp.mapping({
					i = cmp.mapping.scroll_docs(-4),
				}),
				['<C-f>'] = cmp.mapping({
				i = cmp.mapping.scroll_docs(4),
				}),
			}

			cmp.setup({
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'luasnip' },
					{ name = 'emoji' },
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = mapping,
				formatting = {
					fields = { 'kind', 'abbr', 'menu' },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
						local strings = vim.split(kind.kind, '%s', { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "		(" .. (strings[2] or "") .. ")"

						return kind
					end,
				},
				view = {
					entries = { name = 'custom', selection_order = 'near_cursor' },
				},
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
			cmp.setup.cmdline('/', {
				sources = {
					{ name = 'buffer' },
					{ name = 'nvim_lsp_document_symbol' },
				},
				mapping = mapping,
			})
		end,
	},
}
