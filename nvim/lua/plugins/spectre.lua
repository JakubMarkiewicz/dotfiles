local status, spectre = pcall(require, "spectre")

if not status then
	print("Spectre not installed")
	return
end

spectre.setup({
	replace_engine = {
		["sed"] = {
			cmd = "sed",
			args = {
				"-i",
				"",
				"-E",
			},
		},
	},
})
