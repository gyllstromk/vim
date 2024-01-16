local opts = { noremap=true, silent=true }


local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
vim.keymap.set("n", "<leader>a", ":Telescope oldfiles initial_mode=normal<cr>", opts)

vim.keymap.set(
  "n",
  "<leader>E",
  function()
    builtin.find_files({
      cwd = utils.buffer_dir(),
      initial_mode="normal",
    })
  end
)

vim.keymap.set("n", "<leader>j", "<leader>bs", opts)
vim.keymap.set("n", "<leader>J", "<leader>bv", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)

-- toggle numbers for copy/paste
vim.keymap.set("n", "<F7>", ':exec &rnu? "se nornu!" : "se rnu!"<cr>')

vim.keymap.set("n", "<leader>g", ":Hgstatus<cr>", opts)
vim.keymap.set("n", "<leader>v", ":Hgvdiff<cr>", opts)
vim.keymap.set("n", "<leader>V", ":Hgvdiff .^<cr>", opts)
vim.keymap.set("n", "<leader>l", ":HgBlame<cr>", opts)

vim.keymap.set("n", "<leader>o", "wbityping.Optional[ea]", opts)

local actions = require('telescope.actions')
telescope_insert_mode = function(prompt_bufnr)
  vim.schedule(function()
    vim.cmd [[startinsert]]
  end)
end

require('telescope').setup {
  defaults = {
      mappings = {
          i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-o>"] = actions.select_horizontal,
          },
          n = {
              ["o"] = actions.select_horizontal,
              ["/"] = telescope_insert_mode,
          },
      },
  },
}

-- lsp https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
