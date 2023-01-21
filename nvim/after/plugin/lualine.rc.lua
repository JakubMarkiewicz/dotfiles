local status, lualine = pcall(require, 'lualine')

if (not status) then
	print "lualine is not installed"
end

lualine.setup({
	options = {
		theme = 'auto',
		extensions = { 'fugitive' }
	},
	sections = {
		lualine_c = {
			{ 'filename', path = 1 }
		}
	},
})
