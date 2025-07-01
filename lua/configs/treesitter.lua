require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"gdscript",
		"godot_resource",
		"gdshader",
		"python",
		"html",
		"css",
		"scss",
		"javascript",
		"lua",
		"tsx",
		"typescript",
	}, -- puedes agregar más: "lua", "json", etc.
	highlight = {
		enable = true, -- Activa el resaltado
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false, -- Indentación automática basada en sintaxis
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>", -- Inicia selección
			node_incremental = "<TAB>", -- Aumenta al siguiente nodo sintáctico
			node_decremental = "<S-TAB>", -- Reduce al nodo anterior
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
