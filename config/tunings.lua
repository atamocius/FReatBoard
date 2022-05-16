local utils = require('utils/utils')

-- C-1 = 0

local SEPARATOR = {
    name = '---',
    pitches = { 0 },
    frets = 0,
}

local DEFAULT_SELECTED_INDEX = 6

local list = {
    -- Guitar - 7 strings
    {
        name = '[GTR 7, 24] Drop E',
        pitches = {
            59, -- B3
            54, -- F#|Gb3
            50, -- D3
            45, -- A2
            40, -- E2
            35, -- B1
            28, -- E1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop F',
        pitches = {
            60, -- C4
            55, -- G3
            51, -- D#|Eb3
            46, -- A#|Bb2
            41, -- F2
            36, -- C2
            29, -- F1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop F#/Gb',
        pitches = {
            61, -- C#|Db4
            56, -- G#|Ab3
            52, -- E3
            47, -- B2
            42, -- F#|Gb2
            37, -- C#|Db2
            30, -- F#|Gb1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop G',
        pitches = {
            62, -- D4
            57, -- A3
            53, -- F3
            48, -- C3
            43, -- G2
            38, -- D2
            31, -- G1
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop G#/Ab',
        pitches = {
            63, -- D#|Eb4
            58, -- A#|Bb3
            54, -- F#|Gb3
            49, -- C#|Db3
            44, -- G#|Ab2
            39, -- D#|Eb2
            32, -- G#|Ab1
        },
        frets = 24,
    },
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
    {
        name = '[GTR 7, 24] Drop C#/Db',
        pitches = {
            68, -- G#4|Ab4
            63, -- D#4|Eb4
            59, -- B3
            54, -- F#3|Gb3
            49, -- C#3|Db3
            44, -- G#2|Ab2
            37, -- C#2|Db2
        },
        frets = 24,
    },
    {
        name = '[GTR 7, 24] Drop D',
        pitches = {
            69, -- A4
            64, -- E4
            60, -- C4
            55, -- G3
            50, -- D3
            45, -- A2
            38, -- D2
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
        name = '[BASS 6, 24] Drop E',
        pitches = {
            43, -- G2
            38, -- D2
            33, -- A1
            28, -- E1
            23, -- B0
            16, -- E0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop F',
        pitches = {
            44, -- G#|Ab2
            39, -- D#|Eb2
            34, -- A#|Bb1
            29, -- F1
            24, -- C1
            17, -- F0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop F#/Gb',
        pitches = {
            45, -- A2
            40, -- E2
            35, -- B1
            30, -- F#|Gb1
            25, -- C#|Db1
            18, -- F#|Gb0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop G',
        pitches = {
            46, -- A#|Bb2
            41, -- F2
            36, -- C2
            31, -- G1
            26, -- D1
            19, -- G0
        },
        frets = 24,
    },
    {
        name = '[BASS 6, 24] Drop G#/Ab',
        pitches = {
            47, -- B2
            42, -- F#|Gb2
            37, -- C#|Db2
            32, -- G#|Ab1
            27, -- D#|Eb1
            20, -- G#|Ab0
        },
        frets = 24,
    },
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
    DEFAULT_SELECTED_INDEX = DEFAULT_SELECTED_INDEX,
    asList = list,
    asDictionary = transformList(list),
}

return tunings
