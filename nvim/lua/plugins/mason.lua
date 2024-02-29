local status, mason = pcall(require, "mason")

if not status then
	print("Mason not installed")
	return
end

mason.setup({})

local masonStatus, mason_lsp = pcall(require, "mason-lspconfig")

if not masonStatus then
	print("Mason-lspconfig not installed")
	return
end

mason_lsp.setup({
	automatic_installation = true,
})
