local status, git = pcall(require, "git")

if not status then
	print("git not installed")
	return
end

git.setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
		-- Opens a new diff that compares against the current index
		diff = "<Leader>gd",
		-- Close git diff
		diff_close = "<Leader>gD",
		-- Close blame window
		quit_blame = "q",
	},
})
