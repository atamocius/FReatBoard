local utils = require('utils/utils')

local scale_utils = {
    MAJOR_INTERVALS = { 0, 2, 4, 5, 7, 9, 11, },
    NOTES = {
        {
            'C' ,
            'C#',
            'D' ,
            'D#',
            'E' ,
            'F' ,
            'F#',
            'G' ,
            'G#',
            'A' ,
            'A#',
            'B' ,
        },
        {
            'C' ,
            'Db',
            'D' ,
            'Eb',
            'E' ,
            'F' ,
            'Gb',
            'G' ,
            'Ab',
            'A' ,
            'Bb',
            'B' ,
        },
    },
}

local function toNoteIndices(intervals)
    local results = {}

    local ints = utils.split(intervals, ',')

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
    return utils.contains(scale, noteIndex)
end

function scale_utils.isNoteTheRoot(scale, noteIndex)
    return scale[1] == noteIndex
end

function scale_utils.getNote(value, accidental, scale)
    accidental = accidental or 1
    scale = scale or {}

    -- use x % 12 to get note name
    local noteIndex = value % 12
    -- use x // 12 - 1 to get octave
    local octave = value // 12 - 1

    local noteName = scale_utils.NOTES[accidental][noteIndex + 1]

    return {
        name = noteName,
        octave = octave,
        value = value,
        index = noteIndex + 1,
        isInScale = scale_utils.isNoteInScale(scale, noteIndex),
        isRoot = scale_utils.isNoteTheRoot(scale, noteIndex),
    }
end

local function scalesListToDictionary(list)
    local t = {}
    for i = 1, #list do
        t[list[i].name] = list[i].rootRelativeIndices
    end
    return t
end

function scale_utils.transformScalesList(list)
    local s = scalesListToDictionary(list)
    s.keys = utils.map(list, function(item) return item.name end)
    return s
end

return scale_utils
