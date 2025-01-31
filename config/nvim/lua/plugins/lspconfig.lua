-- [[ lspconfig.lua ]] --

return { -- LSP related plugins
	{
		-- `lazydev` configures Lua LSP for neovim configs
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} }, -- Useful status updates for LSP.

			"hrsh7th/cmp-nvim-lsp", -- Allows extra capabilities provided by nvim-cmp

			{
				"git@git.corp.stripe.com:nms/nvim-lspconfig-stripe.git",
				dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "pmizio/typescript-tools.nvim" },
				-- only install on work computers
				cond = vim.g.is_work,
			},
		},

		config = function()
			vim.api.nvim_create_autocmd("LspAttach", { -- run when an LSP attaches to a buffer
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode) -- helper function for remapping
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition") --  To jump back, press <C-t>.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation") -- if implementation is seperate from definition
					map("<leader>gt", require("telescope.builtin").lsp_type_definitions, "[G]oto to [T]ype Definition") -- jump to the type of the symbol
					map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L]ist [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame") -- rename word under cursor
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable the following language servers
			local servers = {
				bashls = {},
				gopls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
				pyright = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								loadOutDirsFromCheck = true,
								features = "all",
							},
							checkOnSave = {
								command = "clippy",
							},
							workspace = {
								symbol = {
									search_kind = "all_symbols",
								},
							},
						},
					},
					diagnostics = {
						enable = true,
						experimental = {
							enable = true,
						},
						style_lints = {
							enable = true,
						},
					},
				},
				taplo = {},
				yamlls = {},
			}

			if vim.g.is_work then
				servers["starpls"] = {
					filetypes = { "bzl", "sky" },
				}
			end

			require("mason").setup()

			-- TODO: move this setup to a dedicated "language setup section"
			-- for each language we need: lsp, linter, debugger
			-- You can add other tools here that you want Mason to install
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"buildifier",
				"goimports",
				"markdownlint",
				"protolint",
				"rubyfmt",
				"ruff",
				"rustfmt",
				"stylua",
				"vale",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed by the server configuration
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			--  protols is not supported by Mason yet
			--  cargo install protols
			require("lspconfig").protols.setup({})

			if vim.g.is_work then
				require("lspconfig_stripe")
				require("lspconfig").payserver_sorbet.setup({})
			end
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
