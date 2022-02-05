local utils = require('utils/utils')

-- C-1 = 0

local SEPARATOR = {
    name = '---',
    pitches = { 0 },
    frets = 0,
}

local list = {
    -- Guitar - 7 strings
    {
        name = '[GTR 7, 24] Drop A',
        pitches = {
            64, -- E4
            59, -- B3
            55, -- G3
            50, -- D3
            45, -- A2
            40, -- E2
            33, -- A1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop A#/Bb',
        pitches = {
            65, -- F4
            60, -- C4
            56, -- G#|Ab3
            51, -- D#|Eb3
            46, -- A#|Bb2
            41, -- F2
            34, -- A#|Bb1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop B',
        pitches = {
            66, -- F#|Gb4
            61, -- C#|Db4
            57, -- A3
            52, -- E3
            47, -- B2
            42, -- F#|Gb2
            35, -- B1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop C',
        pitches = {
            67, -- G4
            62, -- D4
            58, -- A#|Bb3
            53, -- F3
            48, -- C3
            43, -- G2
            36, -- C2
        },
        frets = 24,
    },

    SEPARATOR,

    -- Guitar - 6 strings
    {
        name = '[GTR 6, 22] Drop A',
        pitches = {
            59, -- B3
            54, -- F#|Gb3
            50, -- D3
            45, -- A2
            40, -- E2
            33, -- A1
        },
        frets = 22,
    },
    {
        name = '[GTR 6, 22] Drop A#/Bb',
        pitches = {
            60, -- C4
            55, -- G3
            51, -- D#|Eb3
            46, -- A#|Bb2
            41, -- F2
            34, -- A#|Bb1
        },
        frets = 22,
    },
    {
        name = '[GTR 6, 22] Drop B',
        pitches = {
            61, -- C#|Db4
            56, -- G#|Ab3
            52, -- E3
            47, -- B2
            42, -- F#|Gb2
            35, -- B1
        },
        frets = 22,
    },
    {
        name = '[GTR 6, 22] Drop C',
        pitches = {
            62, -- D4
            57, -- A3
            53, -- F3
            48, -- C3
            43, -- G2
            36, -- C2
        },
        frets = 22,
    },

    SEPARATOR,

    -- Basses
    {
        name = '[BASS 6, 24] Drop A',
        pitches = {
            48, -- C3
            43, -- G2
            38, -- D2
            33, -- A1
            28, -- E1
            21, -- A0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop A#/Bb',
        pitches = {
            49, -- C#|Db3
            44, -- G#|Ab2
            39, -- D#|Eb2
            34, -- A#|Bb1
            29, -- F1
            22, -- A#|Bb0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop B',
        pitches = {
            50, -- D3
            45, -- A2
            40, -- E2
            35, -- B1
            30, -- F#|Gb1
            23, -- B0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop C',
        pitches = {
            51, -- D#|Eb3
            46, -- A#|Gb2
            41, -- F2
            36, -- C2
            31, -- G1
            24, -- C1
        },
        frets = 24,
    },
}

local function toDictionary(list)
    local t = {}
    for i = 1, #list do
        t[list[i].name] = {
            name = list[i].name,
            pitches = list[i].pitches,
            frets = list[i].frets,
        }
    end
    return t
end

local function transformList(list)
    local s = toDictionary(list)
    s.keys = utils.map(list, function(item) return item.name end)
    return s
end

local tunings = {
    asList = list,
    asDictionary = transformList(list),
}

return tunings
