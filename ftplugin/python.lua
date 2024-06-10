local map = vim.api.nvim_set_keymap


map("i", "<leader>pr", "print()i", { noremap = true })
map("i", "<leader>pf", "print(f\"\")hi", { noremap = true })
map("i", "<leader>if", "if :i", { noremap = true })
map("i", "<C-o>", "o", { noremap = true })

map("n", "<leader>o", "wbiOptional[ea]", { noremap = true })
