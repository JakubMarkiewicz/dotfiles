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
					debounce = 25,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
					filetypes = {
						makrdown = true,
						mdx = true,
					},
				},
			})
		end,
	},

	-- ollama
	{ "David-Kunz/gen.nvim" },

	-- global search and replace
	{
		"windwp/nvim-spectre",
		config = function()
			require("plugins.spectre")
		end,
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
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("plugins.null-ls")
		end,
	},

	-- tsserver lsp support
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			settings = {
				expose_as_code_action = "all",
			},
		},
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

	{ "akinsho/git-conflict.nvim", version = "*", config = true },

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
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

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
		config = function()
			require("plugins.autopairs")
		end,
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
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme poimandres")
		end,
	},

	-- indent
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "‧" },

			whitespace = { highlight = { "Whitespace", "NonText" } },
		},
	},

	-- zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format buffer",
			},
		},
		config = function()
			require("plugins.conform")
		end,
	},

	-- wakatime
	{
		"wakatime/vim-wakatime",
	},
})
