-- Window
vim.opt.scrolloff = 8

-- Cursor
vim.opt.guicursor = ''
vim.opt.cursorline = true

-- Line numbers
vim.opt.relativenumber = true

-- Tabs, indents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Diffs
vim.opt.fillchars:append { diff = "╱" }

-- Neovide
vim.opt.guifont = { 'IntoneMono Nerd Font', ':h13' }
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0
