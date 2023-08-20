local status, lazy = pcall(require, "lazy")

if not status then
	print("lazy is not installed")
	return
end

lazy.setup({
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
			})
		end,
	},

	-- search and replace
	{
		"windwp/nvim-spectre",
		config = function()
			require("plugins.spectre")
		end,
	},

	-- highlight todo comments
	{
		"folke/todo-comments.nvim",
	},

	-- highlight occurrences of current cursor word
	"RRethy/vim-illuminate",

	-- tree-sitter
	-- incremental language parser
	-- useful for better highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"rescript",
					"css",
					"lua",
					"xml",
					"php",
					"markdown",
				},
			})
		end,
		lazy = true,
		event = "VeryLazy",
	},

	-- prettier support
	{
		"prettier/vim-prettier",
		run = "yarn install",
		config = function()
			require("plugins.prettier")
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null-ls")
		end,
	},
	"MunifTanjim/prettier.nvim",

	-- tsserver lsp support
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.git-signs")
		end,
	},

	{
		"dinhhuy258/git.nvim",
		cmd = "StartupTime",
		lazy = false,
		config = function()
			require("plugins.git")
		end,
	},

	-- lspsaga - lsp uis
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("plugins.lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- lsp pictograms
	"onsails/lspkind.nvim",

	-- snippet engine
	"L3MON4D3/LuaSnip",

	-- snippets
	"rafamadriz/friendly-snippets",

	-- cmp - auto completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},

	-- common utilities required by telescope
	"nvim-lua/plenary.nvim",

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			require("plugins.telescope")
		end,
		dependencies = {
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.bufferline")
		end,
	},

	-- mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason")
		end,
	},
	"williamboman/mason-lspconfig.nvim",

	-- theme

	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})

			vim.cmd("colorscheme github_dark_high_contrast")
		end,
	},
})
