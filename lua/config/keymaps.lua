-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymap: run current Python file in vertical terminal
vim.keymap.set('n', '<leader>r', function()
  -- Save current file first
  vim.cmd('write')

  -- Get the current file path
  local file = vim.fn.expand('%:p')

  -- Open a vertical terminal split and run Python
  vim.cmd('vsplit | terminal python "' .. file .. '"')

end, { noremap = true, silent = true, desc = "Run current Python file in vertical terminal" })


-- Keymap: run current Python file up to a given line in a vertical terminal
-- Usage: [line]r in normal mode (e.g., 21r)
vim.keymap.set('n', 'r', function()
  -- Get count prefix (the number before r)
  local line = vim.v.count
  if line == 0 then
    -- No count given, run the whole file
    line = vim.fn.line('$')
  end

  -- Save current file first
  vim.cmd('write')

  local file = vim.fn.expand('%:p')
  local tmp = vim.fn.tempname() .. ".py"

  -- Extract lines up to the count into a temp file
  local lines = vim.fn.readfile(file)
  if line > #lines then line = #lines end
  vim.fn.writefile(vim.list_slice(lines, 1, line), tmp)

  -- Run in vertical terminal interactively
  local dir = vim.fn.expand('%:p:h')
  vim.cmd('vsplit | lcd ' .. dir .. ' | terminal python -i "' .. tmp .. '"')
  vim.cmd('startinsert')
  
end, { noremap = true, silent = true, desc = "Run Python up to line in vertical terminal" })



local map = vim.keymap.set
-- Start / Continue
map("n", "<F5>", function() require("dap").continue() end, { desc = "Start/Continue Debug" })
-- Step Over
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
-- Step Into
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
-- Step Out
map("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
-- Toggle breakpoint
map("n", "<leader>b", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
-- Open/close DAP UI
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
