local config = require('config/fretboard')
local scales = require('config/scales')
local utils = require('config/scale_utils')

local index = {}

local Z_INDEX = 11

local NOTE_START_X = 16
local NOTE_START_Y = 104
local NOTE_W = 24
local NOTE_H = 24
local NOTE_SPACING_X = 8
local NOTE_SPACING_Y = 6

local LABEL_START_X = 16
local LABEL_START_Y = 80

local DEFAULT_NOTE_COLOR = 'elm_frame'
local SCALE_NOTE_COLOR = 'blue'
local ROOT_NOTE_COLOR = 'green'

-- fret: 0 to 24
-- string: 1 to X
local function drawNote(fret, string, useFlats, scale)
    local name = 'btnFret' .. fret .. 'String' .. string

    local value = config.tuning[string] + fret
    local note = utils.getNote(value, useFlats, scale)

    local index = note.index
    local caption = note.name
    local color = DEFAULT_NOTE_COLOR

    if note.isRoot then
        color = ROOT_NOTE_COLOR
    elseif note.isInScale then
        color = SCALE_NOTE_COLOR
    end

    GUI.New(name, 'Button', {
        z = Z_INDEX,
        x = NOTE_START_X + fret * (NOTE_W + NOTE_SPACING_X),
        y = NOTE_START_Y + (string - 1) * (NOTE_H + NOTE_SPACING_Y),
        w = NOTE_W,
        h = NOTE_H,
        caption = caption,
        font = 3,
        col_txt = 'txt',
        col_fill = color,
    })
end

local function drawFretLabel(fret)
    local name = 'lblFret' .. fret
    local symName = 'lblFretMarker' .. fret

    local pad = ' '
    if fret < 10 then
        pad = '  '
    end

    GUI.New(name, 'Label', {
        z = Z_INDEX,
        x = LABEL_START_X + fret * (NOTE_W + NOTE_SPACING_X),
        y = 80,
        caption = pad .. fret,
        font = 2,
        color = 'txt',
        bg = 'wnd_bg',
        shadow = false
    })

    if
        fret == 3 or
        fret == 5 or
        fret == 7 or
        fret == 9 or
        fret == 15 or
        fret == 17 or
        fret == 19 or
        fret == 21
    then
        GUI.New(symName, 'Label', {
            z = Z_INDEX + 1,
            x = LABEL_START_X + fret * (NOTE_W + NOTE_SPACING_X) + (NOTE_W / 2 - 2),
            y = 60,
            caption = '.',
            font = 2,
            color = 'txt',
            bg = 'wnd_bg',
            shadow = false
        })
    elseif
        fret == 0 or
        fret == 12 or
        fret == 24
    then
        GUI.New(symName, 'Label', {
            z = Z_INDEX + 1,
            x = LABEL_START_X + fret * (NOTE_W + NOTE_SPACING_X) + (NOTE_W / 2 - 6),
            y = 60,
            caption = '. .',
            font = 2,
            color = 'txt',
            bg = 'wnd_bg',
            shadow = false
        })
    end
end

local function drawFretboard(useFlats, scale)
    for fret = 0, config.frets do
        drawFretLabel(fret)

        for string = 1, #config.tuning do
            drawNote(fret, string, useFlats, scale)
        end
    end

    -- for string = 1, #config.tuning do
    --     for fret = 0, config.frets do
    --         drawNote(fret, string, useFlats, scale, rootIndex)
    --     end
    -- end
end

function index.render()
    -- reaper.ShowConsoleMsg(config.getNote(56).name)
    -- reaper.ShowConsoleMsg(config.getNote(56).octave .. '\n')
    -- reaper.ShowConsoleMsg(config.getNote(56).value .. '\n')

    -- reaper.ShowConsoleMsg(highlights[2].intervals[1] .. '\n')
    -- reaper.ShowConsoleMsg(highlights[2].intervals[2] .. '\n')
    -- reaper.ShowConsoleMsg(highlights[2].intervals[3] .. '\n')
    -- reaper.ShowConsoleMsg(highlights[2].intervals[4] .. '\n')
    -- reaper.ShowConsoleMsg(highlights[2].intervals[5] .. '\n')
    -- reaper.ShowConsoleMsg(highlights[2].intervals[6] .. '\n')
    -- reaper.ShowConsoleMsg(highlights[2].intervals[7] .. '\n')

    drawFretboard(false, scales[2].rootRelativeIndices[5])
end

return index
