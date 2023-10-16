local status, cmp = pcall(require, "cmp")

if not status then
	print("cmp not installed")
	return
end

local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				fallback()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				fallback()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "luasnip", },
		{ name = "buffer", keyword_length = 5, max_item_count = 5 },
		{ name = "path", keyword_length = 3, max_item_count = 5 },
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			mode = "symbol_text",
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
				path = "[path]",
			},
		}),
	},
})
