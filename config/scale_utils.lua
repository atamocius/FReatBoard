local scale_utils = {
    MAJOR_INTERVALS = { 0, 2, 4, 5, 7, 9, 11, },
    NOTES = {
        { 'C' , 'C'  },
        { 'C#', 'Db' },
        { 'D' , 'D'  },
        { 'D#', 'Eb' },
        { 'E' , 'E'  },
        { 'F' , 'F'  },
        { 'F#', 'Gb' },
        { 'G' , 'G'  },
        { 'G#', 'Ab' },
        { 'A' , 'A'  },
        { 'A#', 'Bb' },
        { 'B' , 'B'  },
    },
}

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

local function contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

local function toNoteIndices(intervals)
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

        table.insert(results, scale_utils.MAJOR_INTERVALS[index] + offset)
    end
    return results
end

-- Build intervals array starting from the root
local function createRootRelativeNoteIndices(intervals, rootIndex)
    local ridx = rootIndex - 1

    local result = {}

    for i = 1, #intervals do
        local r = (ridx + intervals[i]) % 12
        table.insert(result, r)
    end

    return result
end

function scale_utils.createAllRootRelativeNoteIndices(intervals)
    local ints = toNoteIndices(intervals)

    local result = {}

    for rootIndex = 1, 12 do
        local rootRelativeIndices =
            createRootRelativeNoteIndices(ints, rootIndex)

        table.insert(result, rootRelativeIndices)
    end

    return result
end

function scale_utils.isNoteInScale(scale, noteIndex)
    return contains(scale, noteIndex)
end

function scale_utils.isNoteTheRoot(scale, noteIndex)
    return scale[1] == noteIndex
end

function scale_utils.getNote(value, useFlats, scale)
    useFlats = useFlats or false
    scale = scale or {}

    -- use x % 12 to get note name
    local noteIndex = value % 12
    -- use x // 12 - 1 to get octave
    local octave = value // 12 - 1

    local noteName = scale_utils.NOTES[noteIndex + 1]

    local accidental = 1
    if useFlats then accidental = 2 end

    return {
        name = noteName[accidental],
        octave = octave,
        value = value,
        index = noteIndex + 1,
        isInScale = scale_utils.isNoteInScale(scale, noteIndex),
        isRoot = scale_utils.isNoteTheRoot(scale, noteIndex),
    }
end

return scale_utils
