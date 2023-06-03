local colorscheme = "kanagawa"

--[[ vim.g.gruvbox_material_background = 'hard' ]]
--[[ vim.g.gruvbox_material_foreground = 'original' ]]
--[[ vim.g.gruvbox_material_enable_bold = 1 ]]
--[[ vim.g.gruvbox_material_transparent_background = 2 ]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
