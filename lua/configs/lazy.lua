return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.telescope")
		end,
		--function(_,opts)
		--	    require("telescope").setup(opts)
		--  end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			-- Base languages for all platforms
			local base_languages = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"python",
			}
		end,
	},
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
	{ "williamboman/mason-lspconfig.nvim" },
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
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		opts = function()
			return require("configs.nvimtree")
		end,
		--[[ config = function(_, opts)
			require("nvim-tree").setup(opts)
		end, ]]
	},
	{

		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			return require("configs.nvim-cmp")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("configs.formating")
		end,
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.api.nvim_create_user_command("DapSidebar", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end, {})
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio", -- Asegúrate de agregar esto
		},
		config = function()
			require("dapui").setup()

			-- Comandos adicionales para abrir/cerrar la UI
			vim.api.nvim_create_user_command("DapUIOpen", function()
				require("dapui").open()
			end, {})

			vim.api.nvim_create_user_command("DapUIClose", function()
				require("dapui").close()
			end, {})

			vim.api.nvim_create_user_command("DapUIReset", function()
				require("dapui").refresh()
			end, {})

			-- Conectar DAP UI con eventos de depuración
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			--dap.listeners.before.event_terminated["dapui_config"] = function()
			--	dapui.close()
			--end

			--dap.listeners.before.event_exited["dapui_config"] = function()
			--	dapui.close()
			--end
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return require("configs.lualine")
		end,
		--[[ config = function(_, opts)
			require("lualine").setup(opts)
		end, ]]
	},

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.alpha")
		end,
	},
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
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	--[[ {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	}, ]]
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
}
