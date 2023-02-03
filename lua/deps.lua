vim.cmd [[packadd packer.nvim]]

return require("packer").startup {
  {
    { "wbthomason/packer.nvim", opt = true } ,
    "gpanders/editorconfig.nvim" ,
    "AndrewRadev/splitjoin.vim" ,
    "machakann/vim-sandwich" ,
    "tweekmonster/startuptime.vim" ,
    "elianiva/gitgud.nvim" ,

    "Mofiqul/vscode.nvim",

    "feline-nvim/feline.nvim",

    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",

    'numToStr/Comment.nvim',
    {
      require('Comment').setup({
        toggler = {
          line = '[cn',
          block = 'gbc',
        },
        opleader = {
          line = '[cn',
          -- block = '[',
        },
        mappings = {
          basic = true,
          extra = true,
        },
      }),
    },
    "JoosepAlviste/nvim-ts-context-commentstring",

    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "kyazdani42/nvim-web-devicons",
    "tami5/sqlite.lua",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    "nvim-telescope/telescope-ui-select.nvim",

    -- requires plenary.nvim
    "ruifm/gitlinker.nvim",

    "https://gitlab.com/yorickpeterse/nvim-pqf",

    "junegunn/vim-easy-align",

    "mhinz/vim-sayonara",

    { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    "MunifTanjim/nui.nvim",

    "hrsh7th/nvim-cmp",
    -- "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "ellisonleao/gruvbox.nvim",

    -- requires plenary.nvim
    "lewis6991/gitsigns.nvim",

    -- requires kyazdani42/nvim-web-devicons
    "akinsho/nvim-bufferline.lua",

    "windwp/nvim-autopairs",

    -- "neovim/nvim-lspconfig",
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "jose-elias-alvarez/nvim-lsp-ts-utils",
    -- "simrat39/rust-tools.nvim",

    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "leoluz/nvim-dap-go",

    "phaazon/hop.nvim",

    -- "folke/zen-mode.nvim",

    "andymass/vim-matchup",

    -- "vim-test/vim-test",

    "norcalli/nvim-colorizer.lua",
'altercation/vim-colors-solarized',
'bronson/vim-trailing-whitespace',
'ConradIrwin/vim-bracketed-paste',
'easymotion/vim-easymotion',
'hhvm/vim-hack',
'phleet/vim-mercenary',
'jlanzarotta/bufexplorer',
'junegunn/vim-easy-align',
'ludovicchabant/vim-lawrencium',
'mileszs/ack.vim',
'nvie/vim-flake8',
'pdavydov108/vim-lsp-cquery',
'Shougo/vimproc.vim',
'scrooloose/nerdcommenter',
'prabirshrestha/asyncomplete.vim',
'prabirshrestha/async.vim',
'prabirshrestha/vim-lsp',
'prabirshrestha/asyncomplete-lsp.vim',
'Shougo/unite.vim',
'tpope/vim-abolish',
'tpope/vim-fugitive',
'vim-scripts/a.vim',
'junegunn/fzf',
'Shougo/denite.nvim',
--Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

'Shougo/echodoc.vim',
'neovim/nvim-lspconfig',
'jose-elias-alvarez/null-ls.nvim',
'nvim-treesitter/nvim-treesitter',
'nvim-telescope/telescope.nvim',
  }
}
