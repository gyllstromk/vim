vim.cmd [[packadd packer.nvim]]

local pkg = require("packer").startup {
  {
    { "wbthomason/packer.nvim", opt = true } ,
    --"gpanders/editorconfig.nvim" ,
    --"AndrewRadev/splitjoin.vim" ,
    --"machakann/vim-sandwich" ,
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
    -- "JoosepAlviste/nvim-ts-context-commentstring",

    {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        --"nvim-lua/popup.nvim",
      },
    },

    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin

    -- "kyazdani42/nvim-web-devicons",
    -- "tami5/sqlite.lua",
    -- { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    -- "nvim-telescope/telescope-ui-select.nvim",

    -- requires plenary.nvim
    -- {
    --   "ruifm/gitlinker.nvim",
    --   requires={"nvim-lua/plenary.nvim"},
    -- }

    -- "https://gitlab.com/yorickpeterse/nvim-pqf",
    --
    -- "junegunn/vim-easy-align",
    --
    -- "mhinz/vim-sayonara",

    -- { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    -- "MunifTanjim/nui.nvim",

    --"hrsh7th/nvim-cmp",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-vsnip",
    -- "hrsh7th/vim-vsnip",
    "ellisonleao/gruvbox.nvim",

    -- requires plenary.nvim
    -- "lewis6991/gitsigns.nvim",

    -- requires kyazdani42/nvim-web-devicons
    -- "akinsho/nvim-bufferline.lua",

    -- "windwp/nvim-autopairs",

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
    "jlanzarotta/bufexplorer",
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
    "vim-scripts/a.vim",
    -- "junegunn/fzf",
    -- "Shougo/denite.nvim",
--Plug "Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    -- 'Shougo/echodoc.vim',
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- 'nvim-treesitter/nvim-treesitter',
    -- 'nvim-telescope/telescope.nvim',
{"/usr/share/fb-editor-support/nvim", as = "meta.nvim" }
  }
}

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

return pkg
