local MAJOR_INTERVALS = { 0, 2, 4, 5, 7, 9, 11, }

local scale_utils = {}

local function trim(s)
    return string.gsub(s, '^%s*(.-)%s*$', '%1')
end

local function split(s, delimiter)
    local result = {};

    for match in (s..delimiter):gmatch('(.-)'..delimiter) do
        match = trim(match)
        table.insert(result, match);
    end

    return result;
end

function scale_utils.toNoteIndices(intervals)
    local results = {}

    local ints = split(intervals, ',')

    for i = 1, #ints do
        local n = ints[i]:sub(1, 1)
        local offset = 0

        if n == 'b' then
            n = ints[i]:sub(2, 2)
            offset = -1
        elseif n == '#' then
            n = ints[i]:sub(2, 2)
            offset = 1
        end

        local index = tonumber(n)

        table.insert(results, MAJOR_INTERVALS[index] + offset)
    end
    return results
end

return scale_utils
