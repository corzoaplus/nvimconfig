local function venv_name()
	if vim.env.VIRTUAL_ENV then
		return string.match(vim.env.VIRTUAL_ENV, "[^/]+$") .. " (venv)"
	end
	return ""
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "kanagawa",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{ "filename", path = 1 },
		},
		lualine_x = {
			venv_name,
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "fugitive", "lazy" },
})
