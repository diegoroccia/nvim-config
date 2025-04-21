local M    = {}
M.time_ago = function(date_str)
    -- Expects date_str in "YYYY-MM-DD" format
    local pattern = "(%d+)%-(%d+)%-(%d+)"
    local year, month, day = date_str:match(pattern)

    if not year or not month or not day then
        return "Invalid date"
    end

    local target_time = os.time({
        year = year,
        month = month,
        day = day,
    })

    local current_time = os.time()
    local diff = os.difftime(current_time, target_time)
    local days = math.floor(diff / (60 * 60 * 24))

    if days < 0 then
        return "in the future"
    elseif days == 0 then
        return "today"
    elseif days == 1 then
        return "1 day ago"
    elseif days < 7 then
        return days .. " days ago"
    elseif days < 30 then
        local weeks = math.floor(days / 7)
        return weeks .. (weeks == 1 and " week ago" or " weeks ago")
    elseif days < 365 then
        local months = math.floor(days / 30)
        return months .. (months == 1 and " month ago" or " months ago")
    else
        local years = math.floor(days / 365)
        return years .. (years == 1 and " year ago" or " years ago")
    end
end

return M
