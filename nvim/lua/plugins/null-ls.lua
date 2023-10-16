local status, none_ls = pcall(require, "null-ls")

if not status then
	print("None-ls not installed")
	return
end

local event = "BufWritePre" -- or "BufWritePost"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function has_eslint_configured(utils)
	return utils.root_has_file(".eslintrc.js")
end

none_ls.setup({
	sources = {
		-- i'd like to opt-in for prettierd but can't get it to work
		none_ls.builtins.formatting.prettier,
		none_ls.builtins.formatting.stylua,

		--null_ls.builtins.formatting.eslint_d.with({ condition = has_eslint_configured }),
		none_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_configured }),
		none_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslint_configured }),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
