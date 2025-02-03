local M = {}

local function get_current_folder_path()
  return vim.fn.expand("%:p:h")
end

local function get_project_root()
  local current_dir = get_current_folder_path()

  while current_dir ~= "/" do
    if vim.fn.filereadable(current_dir .. "/package.json") == 1 then
      return current_dir
    end

    current_dir = vim.fn.fnamemodify(current_dir, ":h")
  end

  return nil
end

local function get_jest_path(project_root)
  return project_root .. "/node_modules/jest/bin/jest.js"
end

local function get_current_test_file()
  return vim.fn.expand("%:p")
end

local function get_current_test_name_in_line(line)
  local _, _, test_name = string.find(line, "^%s*%a+%(['\"](.+)['\"]")
  return test_name;
end

local function get_current_line()
  return vim.api.nvim_get_current_line()
end

local function get_current_file_command(baseCommand)
  local test_file = get_current_test_file()
  return baseCommand .. " '" .. test_file .. "' "
end

local function get_current_line_command(baseCommand)
  local test_file = get_current_test_file();
  local test_name = get_current_test_name_in_line(get_current_line())

  if not test_name then
    print("Error: No tests found in the current line")
    return
  end

  test_name = vim.fn.shellescape(test_name, 1)

  return baseCommand .. " '" .. test_file .. "' -t " .. test_name
end

M.build_jest_command = function(arg)
  local project_root = get_project_root()
  if not project_root then
    print("Error: Couldn't find the root of the project")
    return
  end

  local jest_path = get_jest_path(project_root)
  local command = "node '" .. jest_path .. "'"

  if arg == "file" then
    return get_current_file_command(command)
  elseif arg == "project" then
    return command
  elseif arg == "line" then
    return get_current_line_command(command)
  else
    print("Error: Invalid argument. Use 'file', 'project' or 'line'.")
    return nil
  end
end

return M
