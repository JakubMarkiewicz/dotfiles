local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then
	print("lspconfig not installed")
	return
end


local on_attach = function(client, bufnr)
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.formatting_seq_sync() end
		})
	end

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- nvim_lsp.tsserver.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = on_attach,
		capabilities = capabilities
	},
})

nvim_lsp.jsonls.setup { on_attach = on_attach }

nvim_lsp.prismals.setup {
	on_attach = on_attach,
}

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
}

nvim_lsp.eslint.setup {
	on_attach = on_attach
}
