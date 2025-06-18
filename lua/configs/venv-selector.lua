-- Configuración de venv-selector
require("venv-selector").setup({
	-- Nombres de carpetas a buscar como entornos virtuales
	name = { "venv", ".venv", "env", ".env" },
	-- Habilita la búsqueda en gestores de entornos virtuales como Poetry, Pipenv, etc.
	search_venv_managers = true,
	-- Habilita la búsqueda en el espacio de trabajo actual
	search_workspace = true,
	-- Refresca automáticamente la lista al abrir el selector
	auto_refresh = true,
	-- Notifica al usuario al activar un entorno virtual
	notify_user_on_activate = true,
})
