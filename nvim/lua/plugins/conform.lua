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

local function get_formatter()
	local result
	return function()
		if result then
			return result
		end

		if has_biome_config() then
			result = { { "biome" } }
		else
			result = { { "prettierd" } }
		end
		return result
	end
end

local prettier_or_biome = get_formatter()

conform.setup({
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
	},
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
