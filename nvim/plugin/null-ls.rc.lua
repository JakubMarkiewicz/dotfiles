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
		null_ls.builtins.completion.luasnip,

		--null_ls.builtins.formatting.eslint_d.with({ condition = has_eslint_configured }),
		null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_configured }),
		null_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslint_configured }),


		require("typescript.extensions.null-ls.code-actions"),

		--	null_ls.builtins.diagnostics.tsc,
		--	null_ls.builtins.code_actions.tsc,
		--	null_ls.builtins.completion.tsc,

		null_ls.builtins.diagnostics.cspell,
		null_ls.builtins.code_actions.cspell
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			vim.api.nvim_create_autocmd(event, {
				buffer = bufnr,
				group = group,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = async })
				end,
				desc = "[lsp] format on save",
			})
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
}
