-- Toggle focus mode.
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  ':lua toggle_focus_mode<CR>',
  {
    noremap = true,
    silent = true
  }
)
