local utils = require('utils/utils')

local MIN_OCTAVE = -1
local MAX_OCTAVE = 9

local DARKEST_COLORSET_NAME = 'darkest_octave'
local DARK_COLORSET_NAME = 'dark_octave'
local LIGHT_COLORSET_NAME = 'light_octave'
local LIGHTEST_COLORSET_NAME = 'lightest_octave'

local DARKEST_FACTOR = 0.4
local DARK_FACTOR = 0.55
local LIGHT_FACTOR = 0.85
local LIGHTEST_FACTOR = 1

local opacity = 255
local baseColors = {
    [-1] = { 0, 0, 0, opacity },
    [0] = { 63, 0, 255, opacity },
    [1] = { 255, 25, 227, opacity },
    [2] = { 255, 116, 25, opacity },
    [3] = { 255, 214, 25, opacity },
    [4] = { 25, 255, 35, opacity },
    [5] = { 25, 255, 249, opacity },
    [6] = { 161, 25, 255, opacity },
    [7] = { 0, 0, 0, opacity },
    [8] = { 0, 0, 0, opacity },
    [9] = { 0, 0, 0, opacity },
}

local function scale(color, factor)
    local r, g, b, a = table.unpack(color)
    return {
        utils.clamp(math.floor(r * factor), 0, 255),
        utils.clamp(math.floor(g * factor), 0, 255),
        utils.clamp(math.floor(b * factor), 0, 255),
        a,
    }
end

local function buildColorSet(prefix, factor)
    local result = {}

    for k, v in pairs(baseColors) do
        local name = prefix .. k
        local r = scale(v, factor)
        result[name] = r
    end

    return result
end

local function registerColorSet(colorSet)
    for k, v in pairs(colorSet) do
        GUI.colors[k] = v
    end
end

local function generateNameDictionary(prefix)
    local r = {}
    for i = MIN_OCTAVE, MAX_OCTAVE, 1
    do
        local name = prefix .. i
        r[i] = name
    end
    return r
end

registerColorSet(buildColorSet(DARKEST_COLORSET_NAME, DARKEST_FACTOR))
registerColorSet(buildColorSet(DARK_COLORSET_NAME, DARK_FACTOR))
registerColorSet(buildColorSet(LIGHT_COLORSET_NAME, LIGHT_FACTOR))
registerColorSet(buildColorSet(LIGHTEST_COLORSET_NAME, LIGHTEST_FACTOR))

local colorSets = {
    darkest = generateNameDictionary(DARKEST_COLORSET_NAME),
    dark = generateNameDictionary(DARK_COLORSET_NAME),
    light = generateNameDictionary(LIGHT_COLORSET_NAME),
    lightest = generateNameDictionary(LIGHTEST_COLORSET_NAME),
}

return colorSets
