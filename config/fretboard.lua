local fretboard = {
    tuning = { -- C-1 = 0
        64, -- E4
        59, -- B3
        55, -- G3
        50, -- D3
        45, -- A2
        40, -- E2
        33, -- A1
    },
    frets = 24,
}

local NOTES = {
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
}

local DEFAULT_NOTE_COLOR = 'elm_frame'
local SCALE_NOTE_COLOR = 'blue'
local ROOT_NOTE_COLOR = 'green'

function contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

-- Build intervals array starting from the root
function createIntervalsFromRoot(scale, rootIndex)
    rootIndex = rootIndex - 1

    local result = {}

    for i = 1, #scale.intervals do
        local r = (rootIndex + scale.intervals[i]) % 12
        table.insert(result, r)
    end

    return result
end

function fretboard.getNote(value, useFlats, scale, rootIndex)
    useFlats = useFlats or false
    scale = scale or { intervals = {} }
    rootIndex = rootIndex or 1

    -- use x % 12 to get note name
    local noteIndex = value % 12
    -- use x // 12 - 1 to get octave
    local octave = value // 12 - 1

    local noteName = NOTES[noteIndex + 1]

    local accidental = 1
    if useFlats then accidental = 2 end

    -- TODO: Optimize - should only happen once!
    local rootIntervals = createIntervalsFromRoot(scale, rootIndex)

    local color = DEFAULT_NOTE_COLOR
    if contains(rootIntervals, noteIndex) then
        color = SCALE_NOTE_COLOR
        if noteIndex == (rootIndex - 1) then
            color = ROOT_NOTE_COLOR
        end
    end

    return {
        name = noteName[accidental],
        octave = octave,
        value = value,
        index = noteIndex + 1,
        color = color,
    }
end

return fretboard
