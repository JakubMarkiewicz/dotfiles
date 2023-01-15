local status, saga = pcall(require, "lspsaga")
if (not status) then
	print "lspsaga not installed"
	return
end


local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(
		mode,
		key,
		result,
		{ noremap = true, silent = true }
	)
end

key_mapper('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
key_mapper('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
key_mapper('n', '<C-k>', '<Cmd>Lspsaga code_action<CR>')
key_mapper('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>')
key_mapper('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>')
key_mapper('n', 'gr', '<Cmd>Lspsaga rename<CR>')
