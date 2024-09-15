-- Plugin Manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "gruvbox" } },
    -- add Neovim@Meta and import the language service configuration
    {
      dir = "/usr/share/fb-editor-support/nvim",
      name = "meta.nvim",
      import = "meta.lazyvim",
    },
    -- import/override with your plugins in `~/.config/nvim/lua/plugins`
    -- this can overwrite configurations from all of the above
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins
    -- will load during startup. If you know what you're doing, you can set this
    -- to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin
    -- that support versioning, have outdated releases, which may break your
    -- Neovim install.
    version = false, -- always use the latest git commit
    -- try installing the latest stable version for plugins that support semver
    -- version = "*",
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = false }, -- don't automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
--require('meta.metamate').init()
