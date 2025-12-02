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

local meta_nvim_dir = "/usr/share/fb-editor-support/nvim"

-- Check if the directory exists
local function dir_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end

-- Define your plugin setup table
local plugins = {
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", tag = "v14.15.1", import = "lazyvim.plugins", opts = { colorscheme = "gruvbox" } },
    -- add Neovim@Meta and import the language service configuration
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
}

-- Conditionally add the meta.nvim configuration
if dir_exists(meta_nvim_dir) then
  table.insert(plugins.spec, {
    dir = meta_nvim_dir,
    name = "meta.nvim",
    import = "meta.lazyvim",
  })
else
  print("meta.nvim directory not found, skipping import.")
end

-- Setup plugins
require("lazy").setup(plugins)

-- Define the name of the optional module
local optional_module = "meta.metamate"
-- Attempt to load the optional module using pcall()
local loaded, mod = pcall(require, optional_module)
-- Check if the module was successfully loaded
if loaded then
  require("meta.metamate").init()
else
  -- Handle the case where the module is not installed or has an error
  --print("Module not found or error:", optional_module, mod)
end
local function open_build_file()
  -- Get the directory of the current file
  local current_file = vim.fn.expand("%:p")
  local dir = vim.fn.fnamemodify(current_file, ":h")
  -- Define the possible build files
  local build_files = { "BUCK", "TARGETS" }
  -- Function to check for build files in a directory
  local function find_build_file(directory)
    for _, file in ipairs(build_files) do
      local filepath = directory .. "/" .. file
      if vim.fn.filereadable(filepath) == 1 then
        return filepath
      end
    end
    return nil
  end
  -- Traverse up the directory tree
  while dir ~= "/" do
    local found_file = find_build_file(dir)
    if found_file then
      vim.cmd("edit " .. found_file)
      return
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  -- If no build file is found, print a message
  print("No build file (BUCK or TARGETS) found in the directory tree.")
end
-- Create a command to call the function
vim.api.nvim_create_user_command("OpenBuildFile", open_build_file, {})
vim.api.nvim_create_augroup("SearchMark", { clear = true })
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = "SearchMark",
  pattern = { "/", "?" },
  command = "normal! m'",
})
