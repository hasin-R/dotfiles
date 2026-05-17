-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here

-- Delete default keys to prevent layout conflicts
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

-- small t: Floating Terminal in current folder
vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal(nil, { cwd = LazyVim.root.cwd() })
end, { desc = "Terminal (cwd)" })

-- capital T: Floating Terminal in git project root
vim.keymap.set("n", "<leader>fT", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (root dir)" })

-- small v: Side-by-Side Vertical Split Terminal
vim.keymap.set("n", "<leader>fv", function()
  Snacks.terminal(nil, {
    cwd = LazyVim.root.cwd(),
    win = {
      style = "split",
      position = "right",
      width = 60,
    },
  })
end, { desc = "Terminal Vertical Split (cwd)" })
