--require("impatient").enable_profile()
require("deps")

-- enable filetype.lua
vim.g.do_filetype_lua = 1

-- map leader key to space
vim.g.mapleader = "["
vim.g.maplocalleader = "["

-- order matters
vim.cmd [[
runtime! lua/modules/options.lua
runtime! lua/modules/mappings.lua
runtime! init_after.lua
]]

local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
      mappings = {
          i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
          },
      },
  },
}
