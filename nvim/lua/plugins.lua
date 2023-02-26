local status, lazy = pcall(require, "lazy")

if not status then
	print("lazy is not installed")
	return
end

lazy.setup({
	-- copilot
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_no_tab_map = true
		end,
	},

	-- highlight todo comments
	"folke/todo-comments.nvim",

	-- highlight occurrences of current cursor word
	"RRethy/vim-illuminate",

	-- tree-sitter
	-- incremental language parser
	-- useful for better highlighting
	{ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" },

	-- prettier support
	{ "prettier/vim-prettier", run = "yarn install" },

	-- lsp
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"MunifTanjim/prettier.nvim",

	-- tsserver lsp support
	"jose-elias-alvarez/typescript.nvim",

	-- git
	"lewis6991/gitsigns.nvim",
	{ "dinhhuy258/git.nvim", cmd = "StartupTime", lazy = false, config = true },

	-- lspsaga - lsp uis
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		opts = {
			lightbulb = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = false,
			},
		},
	},

	-- lsp pictograms
	"onsails/lspkind.nvim",

	-- snippet engine
	"L3MON4D3/LuaSnip",

	-- snippets
	"rafamadriz/friendly-snippets",

	-- cmp - auto completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",

	-- autopairs
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- lualine
	"nvim-lualine/lualine.nvim",

	-- common utilities required by telescope
	"nvim-lua/plenary.nvim",

	-- telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- bufferline
	"akinsho/bufferline.nvim",

	-- mason
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- transparency
	"xiyaowong/nvim-transparent",

	-- theme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			--vim.cmd([[colorscheme kanagawa]])
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			--vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
})
