local status, conform = pcall(require, "conform")

if not status then
	print("conform not installed")
	return
end

-- TODO: Should check for config file. If biome then check if "formatter" is "enabled"
local prettier_or_biome = { { "biome", "prettierd" } }

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		["javascript"] = prettier_or_biome,
		["javascriptreact"] = prettier_or_biome,
		["typescript"] = prettier_or_biome,
		["typescriptreact"] = prettier_or_biome,
		["vue"] = prettier_or_biome,
		["css"] = prettier_or_biome,
		["scss"] = prettier_or_biome,
		["less"] = prettier_or_biome,
		["html"] = prettier_or_biome,
		["json"] = prettier_or_biome,
		-- ["jsonc"] =  {{ "prettier", "biome"}},
		["yaml"] = prettier_or_biome,
		["markdown"] = prettier_or_biome,
		["graphql"] = prettier_or_biome,
	},
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
