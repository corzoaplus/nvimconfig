return {
	-- List of tools and LSP servers to ensure are always installed
	ensure_installed = vim.list_extend({
		-- LSP servers
		"lua-language-server", -- Lua LSP (lua_ls)
		"pyright", -- Python LSP
		"typescript-language-server", -- JS/TS LSP (tsserver)
		"html-lsp", -- HTML LSP
		"css-lsp", -- CSS LSP
		"css-variables-language-server", -- CSS variables support (opcional)
		"cssmodules-language-server", -- CSS Modules support (opcional)

		-- Formatters
		"prettier", -- For JS, TS, HTML, CSS, JSON, etc.
		"black", -- Python formatter
		"isort", -- Python import sorter
		"stylua", -- Lua formatter

		-- Debuggers
		"debugpy", -- Python debugger (DAP)
	}, {}), -- You can add more lists here if needed

	max_concurrent_installers = 10,
}
