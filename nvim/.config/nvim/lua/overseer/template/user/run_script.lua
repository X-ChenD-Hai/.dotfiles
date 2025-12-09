return {
  name = "run script",
  builder = function()
    local file = vim.fn.expand("%:p")
    local cmd = { file }
    -- 针对不同文件类型设置不同的执行命令
    if vim.bo.filetype == "go" then
      cmd = { "go", "run", file }
    end
    return {
      cmd = cmd,
      components = {
        { "on_output_quickfix", set_diagnostics = true },  -- 设置诊断信息
        "on_result_diagnostics",  -- 结果显示诊断
        "default",
      },
    }
  end,
  condition = {
    filetype = { "sh", "python", "go" },  -- 支持shell、Python和Go文件
  },
}
