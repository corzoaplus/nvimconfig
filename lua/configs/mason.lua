return {
	ensure_installed = vim.list_extend({
		"lua-language-server",
		"stylua",
		"pyright",
		"prettier",
		"black",
		"isort",
		"typescript-language-server",
		"debugpy",
		"html-lsp",
		"css-lsp",
		"css-variables-language-server",
		"cssmodules-language-server",
	}, {}), -- Aquí podrías extender con otra lista si lo deseas
	max_concurrent_installers = 10,
}
