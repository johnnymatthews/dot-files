local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',
  'nvim-treesitter/nvim-treesitter',
  'junegunn/goyo.vim',
  'nvim-lualine/lualine.nvim',
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000 
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 
        'williamboman/mason.nvim', 
        config = true 
      },
      'williamboman/mason-lspconfig.nvim',
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
});
