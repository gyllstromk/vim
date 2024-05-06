return {
  {
    "folke/tokyonight.nvim",
    opts = function()
      return {
        style = "storm",
        on_colors = function(colors)
          colors.border = colors.orange
        end,
      }
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
}
