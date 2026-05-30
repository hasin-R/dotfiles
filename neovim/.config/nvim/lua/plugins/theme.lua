return {
  -- 1. Download and configure Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Make sure it loads immediately on startup
    priority = 1000, -- Load this before all other plugins
    opts = {
      style = "storm", -- Choose between: 'storm', 'moon', 'night', or 'day'
      transparent = true, -- Keeps your transparent Kitty background setup!
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- 2. Direct LazyVim to load Tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
