-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.mapleader = "["
vim.g.maplocalleader = "["

-- show absolute numbers in insert mode, relative in normal mode
opt.relativenumber = true
-- vim.cmd([[
--   augroup numbertoggle
--   autocmd!
--   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
--   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
--   augroup END
-- ]])

opt.hidden = true -- allow background buffers
opt.joinspaces = false -- join lines without two spaces

-- Disable LazyVim's default clipboard.
opt.clipboard = ""

-- Tab complete for cmd mode should autocomplete the first result immediately.
opt.wildmode = "full"

-- gylls
opt.hlsearch = false -- highlight matching search
opt.foldenable = false
opt.shadafile = os.getenv("HOME") .. "/.vim/main.shada"

-- Function to get the hostname
local function get_hostname()
  local handle = io.popen("hostname")
  local hostname = handle:read("*a")
  handle:close()
  return hostname:match("^%s*(.-)%s*$")  -- Trim any leading/trailing whitespace
end

local hostname = get_hostname()
if hostname:sub(-11) ~= "fbinfra.net" then
  -- vim.g.lazyvim_python_lsp = "basedpyright"
end
