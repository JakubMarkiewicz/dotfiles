local status, lazy = pcall(require, "lazy")

if (not status) then
	print "lazy is not installed"
	return
end

lazy.setup({
	-- highlight todo comments
	"folke/todo-comments.nvim",

	-- highlight occurrences of current cursor word
	"RRethy/vim-illuminate",

	-- theme
	"rebelot/kanagawa.nvim",

	-- tree-sitter
	-- incremental language parser
	-- usefull for better highlighting
	{ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" },

	-- prettier support
	{ "prettier/vim-prettier", run = "yarn install" },

	-- lsp
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"MunifTanjim/prettier.nvim",

	-- git
	"lewis6991/gitsigns.nvim",
	"dinhhuy258/git.nvim",

	-- lspsaga - lsp uis
	"glepnir/lspsaga.nvim",

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
})
