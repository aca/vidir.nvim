local M = {}
local api = vim.api

local function ls()
  api.nvim_buf_clear_namespace(0, 2, 0, -1)
  local line = api.nvim_win_get_cursor(0)
  local fname, _ = vim.api.nvim_get_current_line():gsub("^%d*%s*", "")
  fname = vim.fn.fnameescape(fname)
  local result = vim.fn.systemlist("ls -al " .. fname, vim.api.nvim_get_current_line())[1]

  if vim.v.shell_error ~= 0 then
    result = "[vidir] Renamed"
  else
    result = "[vidir] " .. vim.fn.substitute(result, '\n', '', 'g')
  end
  api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, {{ result, 'Comment' }}, {})
end

M.ls = ls

return M
