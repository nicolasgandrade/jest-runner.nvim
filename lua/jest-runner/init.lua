local M = {}

M.run = function(arg)
  require("jest-runner.commands").run_jest(arg)
end

vim.api.nvim_create_user_command("Jest", function(opts)
  M.run(opts.args)
end, { nargs = 1 })

return M
