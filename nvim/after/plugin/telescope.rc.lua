local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
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
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function() vim.cmd('normal vbd') end,
				},
				["n"] = {
					["o"] = false,
					["h"] = false,
					["g"] = false,
					["e"] = false,
					["N"] = fb_actions.create,
					["R"] = fb_actions.remove,
					["/"] = function()
						vim.cmd('startinsert')
					end
				},
			},
		},
	},
}

telescope.load_extension("file_browser")

vim.keymap.set('n', ';f',
	function()
		builtin.find_files({
			no_ignore = false,
			hidden = false,
			respect_gitignore = false,

		})
	end)
vim.keymap.set('n', ';r', function()
	builtin.live_grep()
end)
vim.keymap.set('n', ';e', function()
	builtin.diagnostics()
end)
vim.keymap.set("n", ";t", function()
	telescope.extensions.file_browser.file_browser({
		cwd = telescope_buffer_dir(),
		respect_gitignore = true,
		no_ignore = true,
		previewer = false,
		hidden = false,
		grouped = true,
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", ";b", function()
	builtin.buffers()

end)
