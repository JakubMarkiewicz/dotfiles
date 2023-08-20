local status, mason = pcall(require, "mason")

if (not status) then
	print "Mason not installed"
	return
end

mason.setup {}


local status, mason_lsp = pcall(require, "mason-lspconfig")

if (not status) then
	print "Mason-lspconfig not installed"
	return
end


mason_lsp.setup {
	automatic_installation = true
}
