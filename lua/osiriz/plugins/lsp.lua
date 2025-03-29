return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim', cmd = { 'Mason' }, opts = {} },
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			{ 'folke/neodev.nvim', opts = {} },
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			vim.diagnostic.config({
				underline = true,
				virtual_text = false,
				virtual_lines = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = ' ',
						[vim.diagnostic.severity.WARN] = ' ',
						[vim.diagnostic.severity.HINT] = ' ',
						[vim.diagnostic.severity.INFO] = ' ',
					}
				}
			})

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
				ensure_installed = {
					'bashls',
					'clangd',
					'docker_compose_language_service',
					'dockerls',
					'gopls',
					'html',
					'lua_ls',
					'pylsp',
					'ts_ls',
				},
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
						require('lspconfig')[server_name].setup(server)
					end,
				}
			})
		end,
		keys = {
			{ '<leader>rn', vim.lsp.buf.rename, desc = 'Rename' },
			{ '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action' },
			{ '<leader>l', function()
					vim.diagnostic.config({
						virtual_lines = not vim.diagnostic.config().virtual_lines
					})
				end, desc = 'Toggle Virtual Lines' },
		}
	},
}
