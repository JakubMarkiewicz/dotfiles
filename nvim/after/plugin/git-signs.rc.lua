local status, git_signs = pcall(require, "gitsigns")

if (not status) then
  print "Gitsigns not installed"
  return
end

git_signs.setup {}
