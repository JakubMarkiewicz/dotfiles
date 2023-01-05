local status, git = pcall(require, "git")

if (not status) then
	print("git not installed")
	return
end

git.setup {
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Close bmale window
		quit_blame = "q"
	}
}
