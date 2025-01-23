local lib = {}

-- returns process name running in the pane
--
function lib.get_process(pane)
    if not pane then
        return ''
    end

    local info = pane:get_foreground_process_info()
    if info then
        return basename(info.executable)
    end
    return ''
end


-- Stripe the path and return the file name
--
function basename(string)
    return string.gsub(string, "(.*[/\\])(.*)", "%2")
end

return lib