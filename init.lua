local packer_bootstrap = require('bootstrap')

vim.g.mapleader = "["
vim.g.maplocalleader = "["

require("deps")

-- enable filetype.lua
vim.g.do_filetype_lua = 1

-- order matters
vim.cmd [[
runtime! lua/modules/options.lua
runtime! lua/modules/mappings.lua
]]

local hostname = io.popen("hostname"):read('*a')
if hostname:match("%.facebook%.com$") then
    require('init_after.lua')
end
