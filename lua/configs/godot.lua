-- base/godot.lua
local M = {}

function M.setup()
	local uv = vim.loop
	local godot_socket_path = "./godothost"
	local project_file = vim.fn.getcwd() .. "/project.godot"

	-- Verifica si el proyecto actual es un proyecto de Godot
	if vim.fn.filereadable(project_file) == 1 then
		-- Si el socket no existe, crea el servidor
		if not uv.fs_stat(godot_socket_path) then
			vim.fn.serverstart(godot_socket_path)
			vim.notify("Godot host iniciado en " .. godot_socket_path, vim.log.levels.INFO)
		else
			vim.notify("Godot host ya está en ejecución: " .. godot_socket_path, vim.log.levels.DEBUG)
		end
	end
end

return M
