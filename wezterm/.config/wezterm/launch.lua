return function(config, wezterm)
    local is_win = wezterm.target_triple:find("windows") ~= nil
    local is_mac = wezterm.target_triple:find("apple") ~= nil
    local is_lin = wezterm.target_triple:find("linux") ~= nil

    local function find_exe(name)
        local finder = wezterm.target_triple:find('windows') and { 'where.exe', name } or { 'which', name }
        local ok, stdout, stderr = wezterm.run_child_process(finder)
        if not ok then
            wezterm.log_error(string.format('find_exe(%s): %s', name, stderr))
            return nil
        end
        local path = stdout:gsub('%s+$', '') -- 去掉换行及后面可能的多余内容
        return path ~= '' and path or nil
    end

    local shell = nil

    if is_lin or is_mac then
        shell = find_exe("zsh") or find_exe("bash") or find_exe("sh")
    elseif is_win then
        shell = find_exe("pwsh") or find_exe("powershell") or find_exe("cmd")
    end


    config.default_prog = { shell }
end
