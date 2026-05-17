return {
  -- 1. Download and configure Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true, -- Erases the background color block
      },
    },
  },

  -- 2. Direct LazyVim to use Rose Pine instead of Catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
