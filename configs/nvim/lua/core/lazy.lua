-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim
-----------------------------------------------------------

-- Bootstrap lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't get an error on the first use.
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

-- Start Lazy.nvim setup.
lazy.setup({
    spec = {

        -- Icons
        { 'kyazdani42/nvim-web-devicons', lazy = true },

        -- File explorer
        {
            'kyazdani42/nvim-tree.lua',
            dependencies = { 'kyazdani42/nvim-web-devicons' },
        },

        -- Treesitter
        { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

        -- FZF searcher.
        { 'junegunn/fzf' }
    },
})
