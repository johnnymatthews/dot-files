-- Disable auto-magic pasting stuff, like comments.
vim.o.paste = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Don't sync clipboard between OS and Neovim.
-- vim.o.clipboard = 'unnamedplus'
vim.o.clipboard = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Disable Neovim theming and just use terminal colours.
vim.o.termguicolors = false

-- Keep focused line in centre of screen.
vim.o.scrolloff = 999

-- Still save and quit on WQ, W, or Q.
vim.cmd("command WQ wq")
vim.cmd("command Wq wq")
vim.cmd("command W w")
vim.cmd("command Q q")

-- Highlight on yank function
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

