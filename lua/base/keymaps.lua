-- Mappings
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true }) -- Move current line down in normal mode
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true }) -- Move current line up in normal mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true }) -- Move selected block down in visual mode
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true }) -- Move selected block up in visual mode
vim.keymap.set("n", "<leader>o", "o<Esc>k") -- Insert new line below without entering insert mode
vim.keymap.set("v", "<leader>y", '"+yy', { noremap = true }) -- Yank selected text to system clipboard
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>:bnext<CR>", { silent = true })

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>") -- Toggle NvimTree and focus current file

-- Buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bnext) -- Switch to next buffer
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious) -- Switch to previous buffer
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete) -- Delete current buffer

-- DAP (Debug Adapter Protocol)
vim.keymap.set("n", "<leader>dt", vim.cmd.DapToggleBreakpoint) -- Toggle breakpoint
vim.keymap.set("n", "<leader>dn", vim.cmd.DapStepOver) -- Step over
vim.keymap.set("n", "<leader>do", vim.cmd.DapStepOut) -- Step out
vim.keymap.set("n", "<leader>dc", vim.cmd.DapContinue) -- Continue execution
vim.keymap.set("n", "<leader>de", function() -- Close DAP UI and terminate session
	local dap = require("dap")
	local dapui = require("dapui")
	dapui.close()
	dap.terminate()
end)
vim.keymap.set("n", "<leader>dp", function() -- Run test method using dap-python
	require("dap-python").test_method()
end)
