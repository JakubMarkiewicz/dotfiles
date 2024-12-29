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

-- ZEN
-- key_mapper("n", "<Leader>z", ":ZenMode<Return>")

-- Oil
key_mapper("n", ";t", ":Oil<Return>")

-- NO NECK PAIN
key_mapper("n", "<Leader>z", ":NoNeckPain<Return>")

-- Unbind suspend
key_mapper("", "<C-z>", "<nop>")

-- lsp rename
vim.keymap.set("n", "gr", vim.lsp.buf.rename)

-- diagnostics jump
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-S-j>", vim.diagnostic.goto_prev)

-- hover
vim.keymap.set("n", "<C-S-k>", vim.lsp.buf.hover)

-- code action
vim.keymap.set("n", "<C-k>", vim.lsp.buf.code_action)

-- search in / around
local s_data = { "i{", "i(", "i[", "it", "a{", "a(", "a[", "at" }
for _, v in ipairs(s_data) do
	vim.keymap.set("n", "<Leader>s" .. v, "v" .. v .. "<Esc>/\\%V")
end

-- center buffer when moving u/d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- TODO: check how to clear prompt, currnetly /<Esc> is a workaround
-- maybe use vim.nvim_buf_clear_highlight
-- hide highlight
vim.keymap.set("n", "<Leader>n", ":noh<Return>")
