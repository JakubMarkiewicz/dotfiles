-- set Leader
vim.g.mapleader = " "

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- Unbind arrows
key_mapper("", "<up>", "<nop>")
key_mapper("", "<down>", "<nop>")
key_mapper("", "<left>", "<nop>")
key_mapper("", "<right>", "<nop>")

-- Don't yank on 'x' | 'dd' | 'p'
key_mapper("n", "x", '"_x')
key_mapper("n", "dd", '"_dd')
key_mapper("x", "p", '"_dP')

-- Tabs
key_mapper("n", "te", ":tabedit<Return>")
key_mapper("n", "tc", ":tabclose<Return>")

-- Split
key_mapper("n", "<Leader>-", ":split<Return><C-w>j")
key_mapper("n", "<Leader>_", ":vsplit<Return><C-w>l")
