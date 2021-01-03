local M = {}
local api = vim.api

function ls()
  api.nvim_buf_clear_namespace(0, 2, 0, -1)
  local line = api.nvim_win_get_cursor(0)
  local cmd = "cut -d '\t' -f2- | xargs -ri -d '\n' ls -alh {}"
  local result = vim.fn.systemlist(cmd, vim.api.nvim_get_current_line())[1]

  if vim.v.shell_error ~= 0 then
    result = "[vidir] Renamed"
  else
    result = "[vidir] " .. vim.fn.substitute(result, '\n', '', 'g')
  end

  api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, {{ result, 'Comment' }}, {})
end

M.ls = ls

return M
