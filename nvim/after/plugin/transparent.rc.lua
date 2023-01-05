local status, transparent = pcall(require, 'transparent')

if (not status) then
	print 'nvim-transparent not installed'
	return
end

transparent.setup {
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
	},
	exclude = {}, -- table: groups you don't want to clear
}
