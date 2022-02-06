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

local function parseInterval(accidentals)
    local offset = 0
    local degreeIndex = 0

    for i = 1, #accidentals do
        local a = accidentals:sub(i, i)

        if a == 'b' then
            offset = offset - 1
        elseif a == '#' then
            offset = offset + 1
        else
            degreeIndex = i
            break
        end
    end

    local n = accidentals:sub(
        degreeIndex,
        degreeIndex + 1 + #accidentals - degreeIndex
    )
    local index = tonumber(n)

    return {
        index = index,
        offset = offset,
    }
end

local function toNoteIndices(intervals)
    local results = {}

    local ints = utils.split(intervals, ',')

    for i = 1, #ints do
        local parsed = parseInterval(ints[i])
        table.insert(
            results,
            scale_utils.MAJOR_INTERVALS[parsed.index] + parsed.offset
        )
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

local function scalesListToNoteIndices(list)
    local s = utils.map(
        list,
        function(item)
            return {
                name = item.name,
                rootRelativeIndices =
                    scale_utils.createAllRootRelativeNoteIndices(item.degrees),
            }
        end
    )
    return s
end

local function scalesListToDictionary(list)
    local t = {}
    for i = 1, #list do
        t[list[i].name] = list[i].rootRelativeIndices
    end
    return t
end

function scale_utils.transformScalesList(list)
    local x = scalesListToNoteIndices(list)
    local s = scalesListToDictionary(x)
    s.keys = utils.map(list, function(item) return item.name end)
    return s
end

return scale_utils
