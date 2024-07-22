return {
  {
    "mhinz/vim-signify",
    init = function(_)
      vim.g.signify_skip = { vcs = { deny = { "git" } } }
    end,
    config = function(_, _)
      vim.api.nvim_set_hl(0, "SignifySignAdd", { link = "GitSignsAdd" })
      vim.api.nvim_set_hl(0, "SignifySignChange", { link = "GitSignsChange" })
      vim.api.nvim_set_hl(
        0,
        "SignifySignChangeDelete",
        { link = "GitSignsChange" }
      )
      vim.api.nvim_set_hl(0, "SignifySignDelete", { link = "GitSignsDelete" })
      vim.api.nvim_set_hl(
        0,
        "SignifySignDeleteFirstLine",
        { link = "GitSignsDelete" }
      )

      vim.g.signify_sign_add = "▎"
      vim.g.signify_sign_change = "▎"
      vim.g.signify_sign_delete = ""
      vim.g.signify_sign_delete_first_line = ""
      vim.g.signify_sign_change_delete = ""
    end,
  },

  {
    "windwp/nvim-autopairs",
    dependencies = {"nvim-cmp"},
    config = function()
      require("nvim-autopairs").setup({})

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
      )
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            -- I don't like having to tap <Esc> twice to exit Telescope.
            ["<esc>"] = require("telescope.actions").close,

            -- gylls
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-o>"] = require("telescope.actions").select_horizontal,
          },
          -- gylls
          n = {
              ["o"] = require("telescope.actions").select_horizontal,
              ["/"] = function(prompt_bufnr)
                vim.schedule(function()
                  vim.cmd [[startinsert]]
                end)
              end,
          },
        },
      },
    },
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {'tami5/sql.nvim'},
    config = function()
      require'telescope'.load_extension('frecency')
    end
  },

  {
    "ludovicchabant/vim-lawrencium",
    config = function(plug, opts)
      vim.keymap.set("n", "<leader>g", ":Hgstatus<cr>", opts)
      vim.keymap.set("n", "<leader>v", ":Hgvdiff<cr>", opts)
      vim.keymap.set("n", "<leader>V", ":Hgvdiff .^<cr>", opts)
      vim.keymap.set("n", "<leader>l", ":HgBlame<cr>", { noremap = true })
    end,
  },
  -- {
  --   "echasnovski/mini.comment",
  --   mappings = {
  --     -- Toggle comment (like `gcip` - comment inner paragraph) for both
  --     -- Normal and Visual modes
  --     comment = '<leader>cn',
  --
  --     -- Toggle comment on current line
  --     comment_line = '<leader>cn',
  --
  --     -- Toggle comment on visual selection
  --     comment_visual = '<leader>cn',
  --
  --     -- Define 'comment' textobject (like `dgc` - delete whole comment block)
  --     -- Works also in Visual mode if mapping differs from `comment_visual`
  --     textobject = '<leader>cn',
  --   },
  -- },
  {
    "numToStr/Comment.nvim",
    config = {
      opleader = {
        line = '<leader>cn',
      },
      toggler = {
        line = '<leader>cn',
      },
      mappings = {
        basic = true,
        extra = false,
      },
    },
  },
  -- {
  --   "nvim-treesitter",
  --   config = function(plug, opts)
  --     require'nvim-treesitter.configs'.setup {
  --       -- overrides [a
  --       textobjects = {
  --         swap = {
  --           enable = false,
  --         }
  --       }
  --     }
  --   end,
  -- },
}
