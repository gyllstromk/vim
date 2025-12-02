return {
  {
    "mhinz/vim-signify",
    init = function(_)
      vim.g.signify_skip = { vcs = { deny = { "git" } } }
    end,
    config = function(_, _)
      vim.api.nvim_set_hl(0, "SignifySignAdd", { link = "GitSignsAdd" })
      vim.api.nvim_set_hl(0, "SignifySignChange", { link = "GitSignsChange" })
      vim.api.nvim_set_hl(0, "SignifySignChangeDelete", { link = "GitSignsChange" })
      vim.api.nvim_set_hl(0, "SignifySignDelete", { link = "GitSignsDelete" })
      vim.api.nvim_set_hl(0, "SignifySignDeleteFirstLine", { link = "GitSignsDelete" })

      vim.g.signify_sign_add = "▎"
      vim.g.signify_sign_change = "▎"
      vim.g.signify_sign_delete = ""
      vim.g.signify_sign_delete_first_line = ""
      vim.g.signify_sign_change_delete = ""
    end,
  },

  {
    "windwp/nvim-autopairs",
    dependencies = { "nvim-cmp" },
    config = function()
      print("ah?")
      require("nvim-autopairs").setup({})

      -- local cmp_autopairs = require("nvim-autopairs")
      -- local cmp = require("nvim-cmp")
      -- cmp.event:on(
      --   "confirm_done",
      --   cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
      -- )

      print("hello")
      local npairs = require("nvim-autopairs")
      -- Initialize nvim-autopairs
      npairs.setup({})
      -- Create a custom rule
      local Rule = require("nvim-autopairs.rule")
      -- Add a rule to detect "{" and prepend "f" to the string
      npairs.add_rules({
        Rule("{", "}"):replace_endpair(function(opts)
          print("suuup")
          -- Schedule the modification to avoid the error
          vim.schedule(function()
            -- Get the current line and cursor position
            local line = vim.api.nvim_get_current_line()
            local col = opts.col
            -- Find the start and end of the string (assumes double quotes)
            local start_quote = line:find('"', 1, true)
            if start_quote then
              local end_quote = line:find('"', start_quote + 1, true)
              -- Check if the cursor is within a string
              if end_quote and col > start_quote and col <= end_quote then
                -- Check if the string starts with an "f"
                local prefix = line:sub(start_quote - 1, start_quote - 1)
                if prefix ~= "f" then
                  -- Prepend "f" to the string
                  local new_line = line:sub(1, start_quote - 1) .. "f" .. line:sub(start_quote)
                  vim.api.nvim_set_current_line(new_line)
                  -- for some reason, opts.row is nil
                  local row = vim.api.nvim_win_get_cursor(0)[1]
                  vim.api.nvim_win_set_cursor(0, { row, opts.col + 1 })
                end
              end
            end
          end)
          return "}"
        end):set_end_pair_length(1),
      })
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'jackysee/telescope-hg.nvim' },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "smart" },
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
                  vim.cmd([[startinsert]])
                end)
              end,
              ["q"] = require("telescope.actions").close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          }
        },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("hg")
    end,
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
  {
    "tpope/vim-fugitive",
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
        line = "<leader>cn",
      },
      toggler = {
        line = "<leader>cn",
      },
      mappings = {
        basic = true,
        extra = false,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    -- enabled = false,
    opts = {
      formatters = {
        lua = {
          command = "stylua",
          args = {
            "--indent_type", "Spaces"
          },
        },
      },
    },
  },
  -- {
  --   "echasnovski/mini.surround",
  --   config = {
  --     custom_surroundings = {
  --       ['('] = { output = { left = '(', right = ')' } },
  --     },
  --   }
  -- },
  -- {
  -- 'nvim-treesitter/nvim-treesitter',
  -- run = ':TSUpdate',
  -- config = function()
  --   require('nvim-treesitter.configs').setup({
  --     -- Enable Treesitter highlighting
  --     highlight = {
  --       enable = true,
  --     },
  --     -- Set prefer_git to true
  --     prefer_git = true,
  --   })
  -- end,
  -- },
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
