local M = {}

M.run_jest = function(arg)
  local jest_cmd = require("jest-runner.utils").build_jest_command(arg)

  if not jest_cmd then
    print("Error: Invalid argument. Use :Jest file | project | line")
    return
  end

  vim.api.nvim_command("vsplit | terminal " .. jest_cmd)

  local term_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_option(term_buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(term_buf, "buflisted", false)
end

return M
