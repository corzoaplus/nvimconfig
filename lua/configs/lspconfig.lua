local lspconfig = require("lspconfig")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		--Navigation
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		--Info/help
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

		--Actions
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

		--Diagnostic
		vim.keymap.set("n", "<C-H>", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "<C-L>", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>dy", vim.diagnostic.open_float)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
lspconfig.cssmodules_ls.setup({})
lspconfig.css_variables.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({})
