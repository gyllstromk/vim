local pkg = require("lazy").setup {
  {
    --"gpanders/editorconfig.nvim" ,
    "AckslD/nvim-trevJ.lua",
    "wellle/context.vim",
    -- "machakann/vim-sandwich" ,
    -- "tweekmonster/startuptime.vim" ,
    -- "elianiva/gitgud.nvim" ,

    -- "Mofiqul/vscode.nvim",

    -- "feline-nvim/feline.nvim",

    "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    -- "windwp/nvim-ts-autotag",

    {
      "numToStr/Comment.nvim",
      config = function()
          require('Comment').setup(
          {
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
          })
      end,
    },

    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        { 'nvim-lua/plenary.nvim' },
        --"nvim-lua/popup.nvim",
      },
    },

    'L3MON4D3/LuaSnip', -- Snippets plugin
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    "hrsh7th/cmp-buffer",
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    {
      "saadparwaiz1/cmp_luasnip",
      -- after = "nvim-cmp",
    },
    {
      "rafamadriz/friendly-snippets",
      after = "LuaSnip",
    },

    --{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- "nvim-telescope/telescope-ui-select.nvim",

    -- dependencies plenary.nvim
    -- {
    --   "ruifm/gitlinker.nvim",
    --   dependencies={"nvim-lua/plenary.nvim"},
    -- }

    -- "https://gitlab.com/yorickpeterse/nvim-pqf",
    --
    -- "junegunn/vim-easy-align",
    --
    -- "mhinz/vim-sayonara",

    -- { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    -- "MunifTanjim/nui.nvim",

    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-vsnip",
    -- "hrsh7th/vim-vsnip",
    "ellisonleao/gruvbox.nvim",

    -- dependencies plenary.nvim
    -- "lewis6991/gitsigns.nvim",

    -- dependencies kyazdani42/nvim-web-devicons
    -- "akinsho/nvim-bufferline.lua",

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

    "jose-elias-alvarez/null-ls.nvim",
    -- "jose-elias-alvarez/nvim-lsp-ts-utils",
    -- "simrat39/rust-tools.nvim",

    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "leoluz/nvim-dap-go",

    -- "phaazon/hop.nvim",

    -- "folke/zen-mode.nvim",

    -- "andymass/vim-matchup",

    -- "vim-test/vim-test",

    -- "bronson/vim-trailing-whitespace",
    -- "ConradIrwin/vim-bracketed-paste",
    -- "easymotion/vim-easymotion",
    -- "hhvm/vim-hack",
    -- "junegunn/vim-easy-align",
    "ludovicchabant/vim-lawrencium",
    -- "mileszs/ack.vim",
    -- "nvie/vim-flake8",
    -- "pdavydov108/vim-lsp-cquery",
    -- "Shougo/vimproc.vim",
    -- "prabirshrestha/asyncomplete.vim",
    -- "prabirshrestha/async.vim",
    -- "prabirshrestha/vim-lsp",
    -- "prabirshrestha/asyncomplete-lsp.vim",
    -- "Shougo/unite.vim",
    --"tpope/vim-abolish",
    "tpope/vim-fugitive",
    "levouh/tint.nvim",
    -- "tmhedberg/SimpylFold",

      -- "junegunn/fzf",
      -- "Shougo/denite.nvim",
  --Plug "Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

      -- 'Shougo/echodoc.vim',
      -- 'jose-elias-alvarez/null-ls.nvim',
      -- 'nvim-treesitter/nvim-treesitter',
      -- 'nvim-telescope/telescope.nvim',
      { dir = "/usr/share/fb-editor-support/nvim", name = "meta.nvim" }
    }
}


-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<C-]>', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require('tint').setup()

--require('telescope').load_extension('fzf')

return pkg
