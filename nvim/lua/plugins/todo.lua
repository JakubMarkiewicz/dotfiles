
local status, todo = pcall(require, 'todo-comments')

if (not status) then
  print 'todo-comments not installed'
  return
end

todo.setup()
