return {
	{
		"habamax/vim-godot",
		event = "vimEnter",
	},
	{
		-- Emmet support for HTML, CSS, JSX, etc.
		"mattn/emmet-vim",

		-- Load the plugin only for relevant filetypes
		ft = { "html", "css", "scss", "javascriptreact", "typescriptreact" },

		-- Set configuration before the plugin loads
		init = function()
			-- Set the Emmet leader key (default is <C-y>)
			-- Press <C-y>, to expand Emmet abbreviations
			vim.g.user_emmet_leader_key = "<C-y>"
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.lualine")
		end,
	},

	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap-python",
		},
		cmd = { "VenvSelect", "VenvSelectCached" },
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<CR>", desc = "Seleccionar entorno virtual" },
			{ "<leader>vc", "<cmd>VenvSelectCached<CR>", desc = "Seleccionar entorno reciente" },
		},
		config = function()
			require("configs.venv-selector")
		end,
		event = "VeryLazy",
	},

	-- Hardtime: Helps reduce inefficient keypress habits by limiting repetitive commands
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			max_count = 5,
			disable_mouse = true,
			restriction_mode = "block",
		},
	},

	-- Telescope: Fuzzy finder for files, buffers, help, etc.
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.telescope")
		end,
	},

	-- Bufferline: Displays open buffers as tab-like lines
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({})
			vim.opt.termguicolors = true
			vim.opt.showtabline = 2
		end,
	},

	-- Treesitter: Enhanced syntax highlighting and code parsing
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- Mason: Manage external tools like LSP servers, DAP, formatters
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
		opts = function()
			return require("configs.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	-- Mason LSP Config: Bridges Mason and nvim-lspconfig
	{ "williamboman/mason-lspconfig.nvim" },

	-- LSPConfig: Built-in LSP support for Neovim
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- Web Devicons: Adds file icons for plugins like NvimTree and Bufferline
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	-- NvimTree: File explorer sidebar for Neovim
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		opts = function()
			return require("configs.nvimtree")
		end,
	},

	-- nvim-cmp: Autocompletion engine
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer source
			"hrsh7th/cmp-path", -- Path source
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
			"rafamadriz/friendly-snippets", -- Collection of snippets
		},
		config = function()
			return require("configs.nvim-cmp")
		end,
	},

	-- Conform: Format-on-save using language-specific formatters
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("configs.formating")
		end,
	},

	-- nvim-dap: Debug Adapter Protocol implementation for Neovim
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			vim.api.nvim_create_user_command("DapSidebar", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end, {})
			dap.set_log_level("DEBUG")
		end,
	},

	-- Python support for nvim-dap (debugging Python)
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local path = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			local dap = require("dap")
			require("dap-python").setup(path)
			dap.adapters.python = {
				type = "executable",
				command = path,
				args = { "-m", "debugpy.adapter" },
			}
		end,
	},

	-- UI for nvim-dap: Panels for variables, breakpoints, etc.
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			vim.api.nvim_create_user_command("DapUIOpen", function()
				dapui.open()
			end, {})
			vim.api.nvim_create_user_command("DapUIClose", function()
				dapui.close()
			end, {})
			vim.api.nvim_create_user_command("DapUIReset", function()
				dapui.refresh()
			end, {})
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
		end,
	},

	-- Alpha: Custom start screen/dashboard for Neovim
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.alpha")
		end,
	},

	-- Indent Blankline: Show indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function()
			return {
				indent = {
					char = "|",
				},
				scope = {
					enabled = true,
				},
			}
		end,
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},

	-- nvim-surround: Add/change/delete surrounding characters like quotes, brackets
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- Autopairs: Automatically close brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Kanagawa: Beautiful, calm colorscheme inspired by Japanese art
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},

	-- Comment.nvim: Easily comment/uncomment lines and blocks
	{
		"numToStr/Comment.nvim",
		config = true,
	},

	-- Noice: Modern notifications, command line, and message UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = false,
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = "80%",
						col = "50%",
					},
					size = {
						width = "auto",
						height = "auto",
					},
					border = {
						style = "rounded",
					},
				},
				mini = {
					timeout = 1000,
				},
			},
			notify = {
				enabled = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function(_, opts)
			require("noice").setup(opts)
			require("notify").setup({
				timeout = 1500,
				stages = "fade",
				render = "minimal",
			})
			vim.notify = require("notify")
		end,
	},

	-- vim-visual-multi: Sublime-style multiple cursors in Vim
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
}
