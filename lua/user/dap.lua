local ok, dap = pcall(require, "dap")
if not ok then return end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
  dapui.setup()
end

local dap_python_ok, dap_python = pcall(require, "dap-python")
if dap_python_ok then
  -- detect the current Python executable from environment
  local python_path = os.getenv("PIXIPYTHON") or os.getenv("PYTHON") or "python"
  dap_python.setup(python_path)
end


