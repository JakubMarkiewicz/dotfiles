local util = require("lspconfig.util")
local status, conform = pcall(require, "conform")

if not status then
	print("conform not installed")
	return
end

local root = vim.fn.getcwd()

local function has_biome_config()
	local path = util.path.join(root, "biome.json")
	local exists = util.path.exists(path)
	return exists and true or false
end

local p_or_b
local function prettier_or_biome()
	return function()
		if p_or_b then
			return p_or_b
		end

		if has_biome_config() then
			p_or_b = { "biome" }
		else
			p_or_b = { "prettierd" }
		end
		return p_or_b
	end
end

conform.setup({
	default_format_opts = {
		lsp_fallback = true,
		stop_after_first = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		["javascript"] = prettier_or_biome(),
		["javascriptreact"] = prettier_or_biome(),
		["typescript"] = prettier_or_biome(),
		["typescriptreact"] = prettier_or_biome(),
		["vue"] = prettier_or_biome(),
		["css"] = prettier_or_biome(),
		["scss"] = prettier_or_biome(),
		["less"] = prettier_or_biome(),
		["html"] = prettier_or_biome(),
		["json"] = prettier_or_biome(),
		-- ["jsonc"] =  {{ "prettier", "biome"}},
		["yaml"] = prettier_or_biome(),
		["markdown"] = prettier_or_biome(),
		["graphql"] = prettier_or_biome(),
		["sql"] = { "sql_formatter" },
		rust = { "rustfmt" },
		go = { "gofmt" },
	},
	format_on_save = { timeout_ms = 500 },
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
		sql_formatter = {
			command = "sql-formatter",
			args = { "-l", "postgresql" },
		},
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
