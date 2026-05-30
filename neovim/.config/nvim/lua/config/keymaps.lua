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

-- Fast compile and run for C++ (Competitive Programming - Space + r)
vim.keymap.set("n", "<leader>r", function()
  -- Save the current file
  vim.cmd("w")

  -- Safely extract file paths to avoid zsh expansion issues
  local file_path = vim.api.nvim_buf_get_name(0)
  local binary_path = file_path:gsub("%.cpp$", "") -- Removes the .cpp extension

  -- FIX: Use 'read' to hold the pane open until you hit Enter.
  -- Added a visual separator so you know exactly when the binary finishes running.
  local cmd = string.format(
    "g++ -std=c++20 -O2 -Wall '%s' -o '%s' && '%s'; echo '\n---------------------------\n[Process completed] Press ENTER to close.'; read",
    file_path,
    binary_path,
    binary_path
  )

  -- Open the terminal on the right side using your preferred Snacks style
  Snacks.terminal(cmd, {
    cwd = LazyVim.root.cwd(),
    win = {
      style = "split",
      position = "right",
      width = 60,
    },
  })
end, { desc = "Compile and Run C++" })

-- Exit insert mode by pressing jk or kj quickly
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit Insert Mode" })
