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

			vim.o.foldenable = true
			vim.o.foldlevel = 99
			vim.o.foldmethod = 'expr'
			vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
			vim.o.foldtext = ''
			vim.o.foldcolumn = '0'

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client:supports_method('textDocument/foldingRange') then
						local win = vim.api.nvim_get_current_win()
						vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
					end
				end
			})

			vim.diagnostic.config({
				underline = true,
				virtual_text = false,
				virtual_lines = {
					current_line = true,
				},
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
		}
	},
}
