local utils = {}

function utils.trim(s)
    return string.gsub(s, '^%s*(.-)%s*$', '%1')
end

function utils.split(s, delimiter)
    local result = {};

    for match in (s..delimiter):gmatch('(.-)'..delimiter) do
        match = utils.trim(match)
        table.insert(result, match);
    end

    return result;
end

function utils.contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

function utils.map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function utils.clone(tbl)
    return {table.unpack(tbl)}
end

function utils.clamp(val, lower, upper)
    return math.max(lower, math.min(upper, val))
end

-- https://www.reaper.fm/sdk/reascript/reascripthelp.html#lua_gfx.getchar
function utils.isWindowFocused()
    return (gfx.getchar(65536) & 2) > 0
end

return utils
