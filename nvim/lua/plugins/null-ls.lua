local status, none_ls = pcall(require, "null-ls")

if not status then
	print("None-ls not installed")
	return
end

local event = "BufWritePre" -- or "BufWritePost"
local augroup = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })

local function has_eslint_configured(utils)
	return utils.root_has_file(".eslintrc.js")
end

none_ls.setup({
	sources = {
		none_ls.builtins.formatting.stylua,
	},
})
