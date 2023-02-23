local opts = { noremap=true, silent=true }


vim.keymap.set("n", "<leader>a", ":Telescope oldfiles initial_mode=normal<cr>", opts)
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
vim.keymap.set("n", "<leader>l", ":HgBlame<cr>", opts)

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


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
