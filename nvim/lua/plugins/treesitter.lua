local status, ts = pcall(require, "nvim-treesitter.configs")

if not status then
	print("nvim-treesitter not installed")
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"bash",
		"css",
		"diff",
		"dockerfile",
		"graphql",
		"help",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"prisma",
		"tsx",
		"typescript",
		"vim",
		"markdown",
		"markdown_inline",
	},
	autotag = {
		enable = true,
	},
})
