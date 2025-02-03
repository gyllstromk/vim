return {
	{
		"liuchengxu/vista.vim",
		lazy = true,
		cmd = "Vista",
		config = function()
			vim.g.vista_default_executive = "nvim_lsp"
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				virtual_text = {
					-- Truncate diagnostic messages to the first line.
					format = function(diagnostic)
						local new_line_location = diagnostic.message:find("\n")

						if new_line_location ~= nil then
							return diagnostic.message:sub(1, new_line_location)
						else
							return diagnostic.message
						end
					end,
				},
			},
			format = {
				-- `arc lint` can take a bit to run.
				timeout_ms = 2500,
			},
		},
		-- config = function()
		-- local lspconfig = require("lspconfig")
		-- local servers = { "prettier@meta", "code-compose", "rust-analyzer@meta", "fb-pyright-ls@meta", "pyre@meta", "thriftlsp@meta", "cppls@meta", "linttool@meta" }
		-- for _, lsp in ipairs(servers) do
		--   require("lspconfig")[lsp].setup {
		--     on_attach = on_attach,
		--   }
		-- end
		-- lspconfig.basedpyright.setup{}
		-- end,
	},
}
