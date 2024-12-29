local status, lazy = pcall(require, "lazy")

if not status then
	print("lazy is not installed")
	return
end

lazy.setup({
	-- folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "lsp", "indent" }
				end,
			})

			vim.keymap.set("n", "zO", require("ufo").openAllFolds)
			vim.keymap.set("n", "zC", require("ufo").closeAllFolds)
		end,
	},

	-- sql
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	},

	-- global search and replace
	{
		"windwp/nvim-spectre",
		config = function()
			require("plugins.spectre")
		end,
	},

	-- file explorer
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end,
	},

	-- tree-sitter
	-- incremental language parser
	-- useful for better highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			local f_get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or f_get_option(filetype, option)
			end
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
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

	-- {
	-- 	"akinsho/git-conflict.nvim",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("git-conflict").setup({
	-- 			highlights = { -- They must have background color, otherwise the default color will be used
	-- 				incoming = "DiffAdd",
	-- 				current = "DiffRemove",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	"sindrets/diffview.nvim",
	-- lsp pictograms
	"onsails/lspkind.nvim",

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
		"sainnhe/gruvbox-material",
		priority = 1000,
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("ColorSchemePre", {
				group = vim.api.nvim_create_augroup("gruvbox_material_background", {}),
				pattern = "gruvbox-material",
				callback = function()
					vim.g.gruvbox_material_background = vim.o.bg == "dark" and "hard" or "medium"
				end,
			})
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	-- indent
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "·" },
			whitespace = { highlight = { "Whitespace", "NonText" } },
		},
	},

	-- zen mode
	-- {
	-- 	"folke/zen-mode.nvim",
	-- },

	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		config = function()
			require("no-neck-pain").setup({
				buffers = {
					scratchPad = {
						-- set to `false` to
						-- disable auto-saving
						enabled = true,
						-- set to `nil` to default
						-- to current working directory
						location = "~/Documents/",
					},
				},
			})
		end,
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("plugins.lint")
		end,
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

	-- mini
	{
		"echasnovski/mini.statusline",
		version = false,
		config = function()
			require("mini.statusline").setup({})
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
})
