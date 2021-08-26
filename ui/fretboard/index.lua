local config = require('config/fretboard')
local scaleUtils = require('config/scale_utils')

local index = {}

function index.newFretboard(
    x,
    y,
    z,
    scale,
    useFlats,
    onClick
)
    local self = {
        x = x,
        y = y,
        z = z,
        scale = scale,
        useFlats = useFlats,
        onClick = onClick,
    }

    local NOTE_W = 24
    local NOTE_H = 24
    local NOTE_SPACING_X = 8
    local NOTE_SPACING_Y = 6

    local DEFAULT_NOTE_COLOR = 'elm_frame'
    local SCALE_NOTE_COLOR = 'blue'
    local ROOT_NOTE_COLOR = 'green'

    -- fret: 0 to 24
    -- string: 1 to X
    local function drawNote(fret, string)
        local name = 'btnFret' .. fret .. 'String' .. string

        local value = config.tuning[string] + fret
        local note = scaleUtils.getNote(value, self.useFlats, self.scale)

        -- local index = note.index
        local caption = note.name
        local color = DEFAULT_NOTE_COLOR

        if note.isRoot then
            color = ROOT_NOTE_COLOR
        elseif note.isInScale then
            color = SCALE_NOTE_COLOR
        end

        GUI.New(name, 'Button', {
            z = self.z,
            x = self.x + fret * (NOTE_W + NOTE_SPACING_X),
            y = self.y + 24 + (string - 1) * (NOTE_H + NOTE_SPACING_Y),
            w = NOTE_W,
            h = NOTE_H,
            caption = caption,
            font = 3,
            col_txt = 'txt',
            col_fill = color,
            func = function()
                self.onClick(fret, string, note)
            end
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
            z = self.z,
            x = self.x + fret * (NOTE_W + NOTE_SPACING_X),
            y = self.y,
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
                z = self.z + 1,
                x = self.x + fret * (NOTE_W + NOTE_SPACING_X) + (NOTE_W / 2 - 2),
                y = self.y - 20,
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
                z = self.z + 1,
                x = self.x + fret * (NOTE_W + NOTE_SPACING_X) + (NOTE_W / 2 - 6),
                y = self.y - 20,
                caption = '. .',
                font = 2,
                color = 'txt',
                bg = 'wnd_bg',
                shadow = false
            })
        end
    end

    local function drawFretboard()
        for fret = 0, config.frets do
            drawFretLabel(fret)

            for string = 1, #config.tuning do
                drawNote(fret, string, self.useFlats, self.scale)
            end
        end
    end

    local function render()
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

        -- local x = scales['Phrygian']
        -- reaper.ShowConsoleMsg(scales.keys[1])
        -- reaper.ShowConsoleMsg(#x)

        drawFretboard()
    end

    return {
        render = render,
    }
end

return index
