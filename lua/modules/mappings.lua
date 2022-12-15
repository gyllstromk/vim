function map(mode, lhs, rhs, opts)
    local options = {}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>a", "<leader>be")
map("n", "<leader>j", "<leader>bs")
map("n", "<leader>J", "<leader>bv")
map("n", "<c-l>", "<c-w>l")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-j>", "<c-w>j")
