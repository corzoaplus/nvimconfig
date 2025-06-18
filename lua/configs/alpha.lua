local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header (ASCII Art NEOVIM)
dashboard.section.header.val = {
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝╚██████╔╝██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝     ╚═╝ ]],
}
dashboard.section.header.opts = {
	position = "center",
	hl = "Type",
}

-- Buttons
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "󰱼  Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}
dashboard.section.buttons.opts = {
	position = "center",
}

-- Footer
dashboard.section.footer.val = "Made with ❤️"
dashboard.section.footer.opts = {
	position = "center",
	hl = "Number",
}

-- Options
dashboard.opts.opts.noautocmd = true

-- Setup
alpha.setup(dashboard.opts)

return dashboard.opts
