local map = vim.api.nvim_set_keymap


map("i", "<leader>pr", "print()i", { noremap = true })
map("i", "<leader>pf", "print(f\"\")hi", { noremap = true })
map("i", "<leader>if", "if :i", { noremap = true })
map("i", "<C-o>", "o", { noremap = true })
map("i", "<leader>lx", "logging.exception()i", { noremap = true })
map("i", "<leader>im", "import ", { noremap = true })

map("n", "<leader>o", "wbiOptional[ea]", { noremap = true })
map("i", "<leader>df", "pd.DataFrame", { noremap = true })
map("i", "<leader>main", 'if __name__ == "__main__":o', { noremap = True})
map("n", "<leader>r", ":! python3.12 %<cr>", { noremap = true })

local opt = vim.opt
opt.formatexpr = ""
