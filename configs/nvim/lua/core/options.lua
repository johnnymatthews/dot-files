-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'				-- Enable mouse support
opt.clipboard = ''         	-- Don't use system clipboard
opt.swapfile = false        -- Don't use swapfile
opt.undofile = true         -- Tell Vim to create undo files...
opt.undodir = '/home/io/.config/nvim/undodir' -- ...And where to save them.
opt.errorbells = false		-- Don't make any noises.
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.incsearch = true        -- Get results while searching.
opt.paste = true            -- Disables auto-commenting lines.


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number.
opt.relativenumber = true   -- Show other lines numbers relative to current line.
opt.showmatch = true        -- Highlight matching parenthesis.
opt.linebreak = true        -- Wrap on word boundary.
opt.laststatus=3            -- Set global statusline.

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.softtabstop = 4         -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines
opt.expandtab = true		-- convert a tab to spaces.
