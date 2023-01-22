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
		"help",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"prisma",
		"tsx",
		"typescript",
		"vim",
	},
	autotag = {
		enable = true,
	},
})
