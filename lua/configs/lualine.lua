return {
	--	options = {
	--		icons_enabled = true,
	--		theme = "auto",
	--		component_separators = { left = "", right = "" },
	--		section_separators = { left = "", right = "" },
	--		disabled_filetypes = {
	--			statusline = {},
	--			winbar = {},
	--		},
	--		ignore_focus = {},
	--		always_divide_middle = true,
	--		globalstatus = false,
	--		refresh = {
	--			statusline = 1000,
	--			tabline = 1000,
	--			winbar = 1000,
	--		},
	--	},
	--	sections = {
	--		lualine_a = { "mode" },
	--		lualine_b = { "branch", "diff", "diagnostics" },
	--		lualine_c = { "buffers" },
	--		lualine_x = { "encoding", "fileformat", "filetype", "filename" },
	--		lualine_y = { "progress" },
	--		lualine_z = { "location" },
	--	},
	--	inactive_sections = {
	--		lualine_a = {},
	--		lualine_b = {},
	--		lualine_c = { "filename" },
	--		lualine_x = { "location" },
	--		lualine_y = {},
	--		lualine_z = {},
	--	},
	--	tabline = {},
	--	winbar = {},
	--	inactive_winbar = {},
	--
	--	extensions = {},
	--
	options = {
		icons_enabled = false,
		theme = "16color",
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = { modified = "[+]", reandonly = "[RO]", unnamed = "[No Name]" },
			},
		},
		lualine_x = { "encoding", "filetype", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
}
