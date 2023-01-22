local status, lualine = pcall(require, "lualine")

if not status then
	print("lualine is not installed")
end

lualine.setup({
	options = {
		theme = "auto",
		extensions = { "fugitive" },
	},
	sections = {
		lualine_b = { "filetype", "diagnostics" },
		lualine_c = {
			{ "filename", path = 1 },
		},
		lualine_x = {},
		lualine_y = { "diff" },
		lualine_z = { "branch" },
	},
})
