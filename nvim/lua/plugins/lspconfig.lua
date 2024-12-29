local status, lspconfig = pcall(require, "lspconfig")

if not status then
	print("lspconfig not installed")
	return
end

local on_attach = function(_, _) end

local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	"cssls",
	"jsonls",
	"tailwindcss",
	"rust_analyzer",
	"prismals",
	"biome",
	"mdx_analyzer",
	"gopls",
	"svelte",
}

for _, v in pairs(servers) do
	lspconfig[v].setup({ on_attach })
end

lspconfig.vtsls.setup({
	-- root_dir = lspconfig.util.root_pattern(".git"),
})

lspconfig.lua_ls.setup({
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
	settings = {
		workingDirectories = { mode = "auto" },
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})
