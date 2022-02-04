local utils = require('utils/utils')

-- C-1 = 0

local list = {
    {
        name = '[GTR 7] Drop A',
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
        name = '[BASS 6] Drop A',
        pitches = {
            48, -- C3
            43, -- G2
            38, -- D2
            33, -- A1
            28, -- E1
            21, -- A0
        },
        frets = 24,
    }
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
