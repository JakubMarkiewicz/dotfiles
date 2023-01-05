local status, bufferline = pcall(require, 'bufferline');

if (not status) then
  print 'bufferline not installed'
  return
end

bufferline.setup {
  options = {
    mode = "tabs",
    separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = 'nvim_lsp',
  },
}


vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
