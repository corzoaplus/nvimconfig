--Basic settings
vim.cmd.colorscheme("default")
vim.g.mapleader = " "
vim.o.wrap = true
vim.opt.linebreak = true
--vim.opt.showbreak = ">>\\"

vim.wo.relativenumber = true
vim.wo.number = true
--Mappings
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>ex", vim.cmd.NvimTreeToggle)
--vim.keymap.set("n", "<leader>1", vim.cmd.bfirst)
--vim.keymap.set("n", "<leader>0", vim.cmd.blast)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
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

--vim.keymap.set("n", "<leader>ds", vim.cmd.DapSidebar)
vim.keymap.set("n", "<leader>dp", function()
	require("dap-python").test_method()
end)
--vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("v", "<leader>zp", 'c(<C-r>")<Esc>', { noremap = true })
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete)
--vim.keymap.set("v", "<leader>y", '"+yy', { noremap = true })
--vim.keymap.set("n", "<leader>d", "3<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
--vim.o.timeoutlen=200
-- Lazy requirement

require("base.plugins.lazy")
