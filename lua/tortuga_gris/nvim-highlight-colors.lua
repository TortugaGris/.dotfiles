local status_ok, nvim_highlight_colors = pcall(require, "nvim-highlight-colors")
if not status_ok then
  return
end

nvim_highlight_colors.setup {
    render = 'virtual', -- 'background 'or 'foreground' or 'first_column'
    virtual_symbol = '■',
	enable_named_colors = true,
	enable_tailwind = false
}
