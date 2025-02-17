local v = vim

v.opt.number = true
v.opt.relativenumber = true
v.wo.wrap = true

v.o.swapfile = false
v.opt.signcolumn = "yes"

v.opt.title = true
v.opt.backup = false
v.opt.scrolloff = 10
v.opt.breakindent = true
v.opt.wildignore:append({ "*/node_modules/*" })

v.opt.tabstop = 2
v.opt.softtabstop = 2
v.opt.shiftwidth = 2
v.opt.autoindent = true
v.opt.smartindent = true
v.opt.pumheight = 10

v.opt.ignorecase = true
v.opt.smartcase = true

v.o.foldcolumn = "0"
v.o.foldlevel = 99
v.o.foldlevelstart = 99
v.o.foldenable = true

v.opt.clipboard:append({ "unnamedplus" })

-- Undercurl
-- v.cmd([[let &t_Cs = "\e[4:3m"]])
-- v.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
v.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
v.opt.clipboard:append({ "unnamedplus" })

v.opt.background = "dark"

v.opt.showtabline = 2

-- display carrier return symbols
-- v.o.list = true
v.o.listchars = "eol:↲"
