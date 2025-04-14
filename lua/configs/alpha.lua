local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[ _   _ ______ _____ _   _ _____ __  __ ]],
	[[| \ | |  ____|  _  | \ | |_   _|  \/  |]],
	[[|  \| | |__  | | | |  \| | | | | \  / |]],
	[[| . ` |  __| | | | | . ` | | | | |\/| |]],
	[[| |\  | |____| |_| | |\  |_| |_| |  | |]],
	[[|_| \_|______|_____|_| \_|_____|_|  |_|]],
}

dashboard.section.buttons.val = {
	dashboard.button("e", "Nuevo archivo", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "Buscar archivo", ":Telescope find_files<CR>"),
	dashboard.button("q", "Salir", ":qa<CR>"),
}

dashboard.section.footer.val = "Hecho en Debian sin entorno gráfico"
dashboard.opts.opts.noautocmd = true

return dashboard.opts
