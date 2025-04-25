--Basic settings
vim.o.foldmethod = "indent" -- O puedes probar "syntax"
vim.o.foldlevel = 99 -- Abre todo por defecto
vim.o.foldenable = true -- Activa el plegado
vim.cmd.colorscheme("default")
vim.g.mapleader = " "
vim.o.wrap = true
vim.opt.linebreak = true
vim.wo.relativenumber = true
vim.wo.number = true

--Mappings
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover línea abajo", silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover línea arriba", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover bloque abajo", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover bloque arriba", silent = true })
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("v", "<leader>y", '"+yy', { noremap = true })

--NvimTree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>ex", vim.cmd.NvimTreeToggle)

--Buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete)

--DAP
vim.keymap.set("n", "<leader>dt", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<leader>dn", vim.cmd.DapStepOver)
vim.keymap.set("n", "<leader>do", vim.cmd.DapStepOut)
vim.keymap.set("n", "<leader>dc", vim.cmd.DapContinue)
vim.keymap.set("n", "<leader>de", function()
	local dap = require("dap")
	local dapui = require("dapui")
	dapui.close()
	dap.terminate()
end, { desc = "Cerrar debugger" })
vim.keymap.set("n", "<leader>dp", function()
	require("dap-python").test_method()
end)

--Requires
require("base.plugins.lazy")
