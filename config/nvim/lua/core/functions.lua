-- Function to toggle Goyo, Lualine, and set line break
function _G.toggle_focus_mode()
  print("Function toggle_goyo_lualine_linebreak is called")
  -- Toggle Goyo
  vim.cmd('Goyo')

  -- Toggle Lualine
  require('lualine').hide()

  -- Set line break
  vim.opt.wrap = true -- Enable line wrap
end
