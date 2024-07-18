-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- gylls remove these
cmd("unmap H")
cmd("unmap L")
cmd("unmap n")  -- for some reason the new config always defaults n to next (top down) instead of n (search direction)
cmd("unmap N")
--cmd("unmap <leader>l")

--cmd("unmap <S-tab>")
-- endgylls

-- map arrow keys to pane shifts.
map("n", "<Up>", "<C-w><C-k>", { noremap = true })
map("n", "<Down>", "<C-w><C-j>", { noremap = true })
map("n", "<Left>", "<C-w><C-h>", { noremap = true })
map("n", "<Right>", "<C-w><C-l>", { noremap = true })

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command W w")
cmd("command Q q")

-- using Meta/Alt can result in <Esc> being interpreted as Meta/Alt, which makes
-- for odd behaviors when quickly pressing <Esc> sometimes, so disable Meta
-- chords.
-- https://github.com/neovim/neovim/issues/20064
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del({"n"}, "<leader>l")
vim.keymap.set({"n"}, "<leader>l", ":HgBlame<cr>", opts)


vim.keymap.set("n", "<leader>a", ":Telescope oldfiles initial_mode=normal<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>A", ":Telescope myles<cr>", opts)
vim.keymap.set("n", "<leader>H", ":Telescope hg diff<cr>", opts)
vim.keymap.set("n", "<leader>z", ":Telescope biggrep s<cr>", opts)
vim.keymap.set("n", "<leader>po", ":GetCodehubLink<cr>", opts)
vim.keymap.set("v", "<leader>po", ":GetCodehubLink<cr>", opts)

vim.keymap.set(
  "n",
  "<C-]>",
  function()
    require("telescope.builtin").lsp_definitions({
      reuse_win = true,
    })
  end
)

vim.keymap.set(
  "n",
  "<leader>E",
  function()
    require("telescope.builtin").find_files({
      cwd = require("telescope.utils").buffer_dir(),
      initial_mode="normal",
    })
  end
)

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

-- diff merge
map("n", "@o", "dd/=======<cr>d/>>>>>>><cr>dd/<<<<<<<<cr>", { noremap = true })
map("n", "@t", "d/=======<cr>dd/>>>>>>><cr>dd/<<<<<<<<cr>", { noremap = true })
