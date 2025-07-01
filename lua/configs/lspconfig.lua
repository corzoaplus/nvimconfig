local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
require("lspconfig").gdscript.setup(capabilities)

local lspconfig = require("lspconfig")

-- Auto command that runs every time an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enables LSP-based completion (triggered with <C-x><C-o>)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = ev.buf }

		-- LSP navigation keybindings
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Show references
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation

		-- LSP information/help keybindings
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation on hover
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- Show function signature

		-- LSP actions
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts) -- Rename symbol
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts) -- Code actions

		-- Diagnostics navigation
		vim.keymap.set("n", "<C-H>", vim.diagnostic.goto_prev) -- Go to previous diagnostic
		vim.keymap.set("n", "<C-L>", vim.diagnostic.goto_next) -- Go to next diagnostic
		vim.keymap.set("n", "<leader>dy", vim.diagnostic.open_float) -- Show diagnostic in a floating window
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist) -- Add diagnostics to location list

		-- Show type definition
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

		-- Format buffer asynchronously
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- LSP Server Configurations

-- HTML language server
lspconfig.html.setup({})

-- CSS language server (standard CSS support)
lspconfig.cssls.setup({})

-- TypeScript/JavaScript language server
lspconfig.ts_ls.setup({})

-- Python language server (via Pyright)
lspconfig.pyright.setup({})

-- Lua language server (used for Neovim Lua API development)
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- Prevent 'vim' undefined warning
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
				checkThirdParty = false, -- Disable third-party checking
			},
		},
	},
})
