-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require('dap').configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
    },
}
