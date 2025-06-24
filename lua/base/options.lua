-- Basic settings
vim.opt.encoding = "utf-8" -- set encoding
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.swapfile = false -- do not use a swap file for the buffer
vim.opt.backup = false -- do not keep a backup file
vim.opt.updatetime = 50
vim.g.mapleader = " " -- Set <Space> as the leader key
vim.o.foldmethod = "indent" -- Use indentation to define folds (try "syntax" as an alternative)
vim.o.foldlevel = 99 -- Open all folds by default
vim.o.foldenable = true -- Enable code folding
vim.o.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Break lines at word boundaries when wrapping
vim.opt.breakindent = true -- Keep indentation on wrapped lines
vim.wo.relativenumber = true -- Show relative line numbers
vim.wo.number = true -- Show absolute line number on the current line
vim.opt.scrolloff = 8 -- Keep at least 8 lines above and below the cursor
vim.opt.sidescrolloff = 8 -- Keep at least 8 columns to the left and right of the cursor
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override 'ignorecase' if search pattern contains uppercase
vim.opt.hlsearch = false -- Don't highlight all matches of the previous search
vim.opt.incsearch = true -- Show matches as you type the search
vim.opt.termguicolors = true -- Enable true color support in the terminal

-- Python-specific formatting
vim.api.nvim_create_autocmd({ "bufnewfile", "bufread" }, {
	pattern = "*.py", -- only apply to python files
	callback = function()
		vim.bo.textwidth = 79 -- set text width only for the current buffer
		vim.wo.colorcolumn = "79" -- set color column only for the current window
	end,
})
