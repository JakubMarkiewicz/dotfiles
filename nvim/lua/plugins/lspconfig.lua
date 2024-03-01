local status, lspconfig = pcall(require, "lspconfig")

if not status then
	print("lspconfig not installed")
	return
end

local on_attach = function(_, _) end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lspconfig.cssls.setup({ on_attach = on_attach, capabilities = capabilities })

lspconfig.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })

lspconfig.prismals.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.biome.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.mdx_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
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

lspconfig.eslint.setup({
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
	capabilities = capabilities,
})
