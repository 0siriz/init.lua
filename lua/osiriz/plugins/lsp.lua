return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim', cmd = { 'Mason' }, opts = {} },
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'SmiteshP/nvim-navic',
			'aznhe21/actions-preview.nvim',
			{ 'folke/neodev.nvim', opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('osiriz-lsp-attach', { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if client and client.server_capabilities.documentSymbolProvider then
						require("nvim-navic").attach(client, event.buf)
					end

					local map = function(keys, func, desc, mode)
						mode = mode or 'n'
						vim.keymap.set(mode, keys, func, { buffer=event.buf, desc='LSP: ' .. desc })
					end

					map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
					map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
					map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
					map('<leader>ca', require('actions-preview').code_actions, '[C]ode [A]ction', { 'n', 'x' })
					map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				end
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local servers = {
				ts_ls = {
					init_options = {
						preferences = {
							disableSuggestions = true,
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								disable = {
									'missing-fields'
								},
							},
						},
					},
				},
			}

			require('mason').setup()

			require('mason-lspconfig').setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
						require('lspconfig')[server_name].setup(server)
					end,
				}
			})
		end,
	},
}
