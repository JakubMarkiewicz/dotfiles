local status, ts = pcall(require, 'nvim-treesitter.configs')

if (not status) then
	print 'nvim-treesitter not installed'
	return
end

ts.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		'help',
		'tsx',
		'javascript',
		'lua',
		'json',
		'css',
		'prisma'
	},
	autotag = {
		enable = true
	}
}
