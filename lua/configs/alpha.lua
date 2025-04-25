local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[.     .       .  .   . .   .   . .    +  .]],
	[[  .     .  :     .    .. :. .___---------___.]],
	[[       .  .   .    .  :.:. _".^ .^ ^.  '.. :"-_. .]],
	[[    .  :       .  .  .:../:            . .^  :.:\.]],
	[[        .   . :: +. :.:/: .   .    .        . . .:\]],
	[[ .  :    .     . _ :::/:               .  ^ .  . .:\]],
	[[  .. . .   . - : :.:./.                        .  .:\]],
	[[  .      .     . :..|:                    .  .  ^. .:|]],
	[[    .       . : : ..||        .                . . !:|]],
	[[  .     . . . ::. ::\(                           . :)/]],
	[[ .   .     : . : .:.|. ######              .#######::|]],
	[[  :.. .  :-  : .:  ::|.#######           ..########:|]],
	[[ .  .  .  ..  .  .. :\ ########          :######## :/]],
	[[  .        .+ :: : -.:\ ########       . ########.:/]],
	[[    .  .+   . . . . :.:\. #######       #######..:/]],
	[[      :: . . . . ::.:..:.\           .   .   ..:/]],
	[[   .   .   .  .. :  -::::.\.       | |     . .:/]],
	[[      .  :  .  .  .-:.":.::.\             ..:/]],
	[[ .      -.   . . . .: .:::.:.\.           .:/]],
	[[.   .   .  :      : ....::_:..:\   ___.  :/]],
	[[   .   .  .   .:. .. .  .: :.:.:\       :/]],
	[[     +   .   .   : . ::. :.:. .:.|\  .:/|]],
	[[     .         +   .  .  ...:: ..|  --.:|]],
	[[.      . . .   .  .  . ... :..:.."(  ..)"]],
	[[ .   .       .      :  .   .: ::/  .  .::\]],
}

-- Opcional: agrega un color personalizado
dashboard.section.header.opts = {
	position = "center",
	hl = "Type", -- Puedes cambiar esto por 'String', 'Constant', 'Function', etc., o definir uno tú mismo
}
dashboard.section.buttons.val = {
	dashboard.button("e", "Nuevo archivo", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "Buscar archivo", ":Telescope find_files<CR>"),
	dashboard.button("q", "Salir", ":qa<CR>"),
}

dashboard.section.footer.val = "Hecho en Debian sin entorno gráfico"
dashboard.opts.opts.noautocmd = true

return dashboard.opts
