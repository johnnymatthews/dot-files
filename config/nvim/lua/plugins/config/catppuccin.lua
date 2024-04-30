vim.o.termguicolors = true

-- vim.cmd.colorscheme "catppuccin-latte"
-- vim.cmd.colorscheme "catppuccin-frappe"
-- vim.cmd.colorscheme "catppuccin-macchiato"
vim.cmd.colorscheme "catppuccin-mocha"

require("catppuccin").setup({
    integrations = {
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
})
