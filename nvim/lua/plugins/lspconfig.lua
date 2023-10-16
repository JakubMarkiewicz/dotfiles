local status, nvim_lsp = pcall(require, "lspconfig")

if not status then
	print("lspconfig not installed")
	return
end

local on_attach = function(client, bufnr)
	-- format on save
	-- if client.server_capabilities.documentFormattingProvider then
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		group = vim.api.nvim_create_augroup("Format", { clear = true }),
	-- 		buffer = bufnr,
	-- 		callback = function()
	-- 			vim.lsp.buf.formatting_seq_sync()
	-- 		end,
	-- 	})
	-- end
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

nvim_lsp.cssls.setup({ on_attach = on_attach, capabilities = capabilities })

nvim_lsp.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })

nvim_lsp.prismals.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

nvim_lsp.eslint.setup({
	on_attach = function(_client, bufnr)
		vim.api.nvim_create_autocmd("BufWrite", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
	capabilities = capabilities,
})
