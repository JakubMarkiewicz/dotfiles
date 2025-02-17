local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		prompt_prefix = ":: ",
		sorting_strategy = "ascending",
		initial_mode = "insert",
		selection_strategy = "reset",
		dynamic_preview_title = true,
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			--	theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["n"] = {
					-- open file with default app
					["o"] = fb_actions.open,
					-- toggle hidden
					["h"] = fb_actions.toggle_hidden,
					-- goto parent
					["g"] = false,
					-- goto home
					["e"] = false,
					-- create new
					["N"] = fb_actions.create,
					-- remove
					["R"] = fb_actions.remove,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

-- find files
vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = false,
		path_display = { "filename_first" },
	})
end)

-- go to definition
vim.keymap.set("n", "gd", function()
	builtin.lsp_definitions()
end)

-- go to type definition
vim.keymap.set("n", "gD", function()
	builtin.lsp_type_definitions()
end)

-- display references
vim.keymap.set("n", "gR", function()
	builtin.lsp_references()
end)

-- resume previous telescope action
vim.keymap.set("n", ";r", function()
	builtin.resume()
end)

-- grep in files
vim.keymap.set("n", ";g", function()
	builtin.live_grep({
		path_display = { "tail" },
	})
end)

-- file browser
-- currently testing oil.nvim as a replacement
-- vim.keymap.set("n", ";t", function()
-- 	telescope.extensions.file_browser.file_browser({
-- 		cwd = telescope_buffer_dir(),
-- 		respect_gitignore = true,
-- 		no_ignore = false,
-- 		previewer = false,
-- 		hidden = false,
-- 		grouped = true,
-- 		initial_mode = "normal",
-- 	})
-- end)

-- buffers
vim.keymap.set("n", ";b", function()
	builtin.buffers()
end)

-- git
vim.keymap.set("n", "<Leader>gs", function()
	builtin.git_status()
end)
