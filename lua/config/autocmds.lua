-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.keymap.set("n", "<leader>a", ":Telescope oldfiles initial_mode=normal<cr>", {noremap = true, silent = true})
