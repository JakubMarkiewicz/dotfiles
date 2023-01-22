local status, null_ls = pcall(require, "null-ls")

if (not status) then
	print "Null-ls not installed"
	return
end

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local function has_eslint_configured(utils)
	return utils.root_has_file(".eslintrc.js")
end

null_ls.setup {
	diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = {
		-- i'd like to opt-in for prettierd but can't get it to work
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,

		--null_ls.builtins.formatting.eslint_d.with({ condition = has_eslint_configured }),
		null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_configured }),
		null_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslint_configured }),


		require("typescript.extensions.null-ls.code-actions"),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end
}
