local map = vim.api.nvim_set_keymap

function print_method()
    local filename = vim.fn.expand('%:t')
    if string.match(filename, 'Test') then
      return 'var_dump();<Left><Left>';
    end
    return 'slogx();<Left><Left>';
end

map('i', '<leader>pr', print_method(), {noremap = true})
