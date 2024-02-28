local status, conform = pcall(require, "conform")

if not status then
	print("conform not installed")
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		["javascript"] = { "prettier" },
		["javascriptreact"] = { "prettier" },
		["typescript"] = { "prettier" },
		["typescriptreact"] = { "prettierd" },
		["vue"] = { "prettier" },
		["css"] = { "prettier" },
		["scss"] = { "prettier" },
		["less"] = { "prettier" },
		["html"] = { "prettier" },
		["json"] = { "prettier" },
		-- ["jsonc"] = { "prettier" },
		["yaml"] = { "prettier" },
		["markdown"] = { "prettier" },
		["graphql"] = { "prettier" },
	},
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
