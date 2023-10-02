local status, saga = pcall(require, "lspsaga")
if not status then
	print("lspsaga not installed")
	return
end

saga.setup({
	lightbulb = {
		enable = false,
	},
	finder = {
		default = "imp+ref",
	},
})

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

key_mapper("n", "<C-J>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
key_mapper("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
key_mapper("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
key_mapper("n", "<C-k>", "<Cmd>Lspsaga code_action<CR>")
key_mapper("n", "gd", "<Cmd>Lspsaga finder<CR>")
key_mapper("n", "gD", "<Cmd>Lspsaga goto_definition<CR>")
key_mapper("n", "gp", "<Cmd>Lspsaga peek_definition<CR>")
key_mapper("n", "gr", "<Cmd>Lspsaga rename<CR>")
key_mapper("n", "gT", "<Cmd>Lspsaga goto_type_definition<CR>")
key_mapper("n", "gt", "<Cmd>Lspsaga peek_type_definition<CR>")
