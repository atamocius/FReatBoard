local scaleUtils = require('config/scale_utils')

local fretboard = {}

function fretboard.newFretboard(
    x,
    y,
    z,
    mode,
    scale,
    accidental,
    tuning,
    onClick
)
    local self = {
        x = x,
        y = y,
        z = z,
        mode = mode,
        scale = scale,
        accidental = accidental,
        tuning = tuning,
        onClick = onClick,
        buffer = {},
    }

    local NOTE_W = 24
    local NOTE_H = 24
    local NOTE_SPACING_X = 8
    local NOTE_SPACING_Y = 6

    local DEFAULT_NOTE_COLOR = 'elm_frame'
    local SCALE_NOTE_COLOR = 'blue'
    local ROOT_NOTE_COLOR = 'green'
    local SELECTED_NOTE_COLOR = 'purple'

    local MODE_CHORD = 1
    local MODE_SINGLE = 2

    local MAX_FRETS = 24
    local MAX_STRINGS = 9

    -- Forward function references
    local redrawFretboard

    local function isNoteSelected(fret, string)
        return
            self.buffer[string] ~= nil and
            self.buffer[string].fret == fret
    end

    local function selectNote(fret, string, note)
        self.buffer[string] = {
            fret = fret,
            string = string,
            note = note,
        }
        redrawFretboard()
    end

    local function deselectNote(fret, string)
        self.buffer[string] = nil
        redrawFretboard()
    end

    local function onNoteClick(fret, string, note)
        if self.mode == MODE_CHORD then
            if isNoteSelected(fret, string) then
                deselectNote(fret, string)
            else
                selectNote(fret, string, note)
            end
        end

        self.onClick(fret, string, note)
    end

    local function tryDrawNoteButton(fret, string, note, caption, color)
        local name = 'btnFret' .. fret .. 'String' .. string

        local g = GUI.elms[name]

        if g == nil then
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
                    onNoteClick(fret, string, note)
                end
            })
        else
            g.caption = caption
            g.col_fill = color
            g.func = function()
                onNoteClick(fret, string, note)
            end
            g:init()
            g:redraw()
        end
    end

    local function tryDeleteNoteButton(fret, string)
        local name = 'btnFret' .. fret .. 'String' .. string

        local g = GUI.elms[name]

        if g ~= nil then
            g:delete()
        end
    end

    local function redrawNote(fret, string)
        if string > #self.tuning.pitches or fret > self.tuning.frets then
            tryDeleteNoteButton(fret, string)
            return
        end

        local value = self.tuning.pitches[string] + fret
        local note = scaleUtils.getNote(value, self.accidental, self.scale)
        local caption = note.name
        local color = DEFAULT_NOTE_COLOR

        if isNoteSelected(fret, string) then
            color = SELECTED_NOTE_COLOR
        elseif note.isRoot then
            color = ROOT_NOTE_COLOR
        elseif note.isInScale then
            color = SCALE_NOTE_COLOR
        end

        tryDrawNoteButton(fret, string, note, caption, color)
    end

    redrawFretboard = function()
        for fret = 0, MAX_FRETS do
            for string = 1, MAX_STRINGS do
                redrawNote(fret, string)
            end
        end
    end

    -- fret: 0 to 24
    -- string: 1 to X
    local function drawNote(fret, string)
        if string > #self.tuning.pitches or fret > self.tuning.frets then
            return
        end

        local name = 'btnFret' .. fret .. 'String' .. string

        local value = self.tuning.pitches[string] + fret
        local note = scaleUtils.getNote(value, self.accidental, self.scale)
        local caption = note.name
        local color = DEFAULT_NOTE_COLOR

        if note.isRoot then
            color = ROOT_NOTE_COLOR
        elseif note.isInScale then
            color = SCALE_NOTE_COLOR
        end

        tryDrawNoteButton(fret, string, note, caption, color)
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
        for fret = 0, MAX_FRETS do
            drawFretLabel(fret)

            for string = 1, #self.tuning.pitches do
                drawNote(fret, string)
            end
        end
    end

    local function render()
        drawFretboard()
    end

    local function clear()
        self.buffer = {}
        redrawFretboard()
    end

    local function setMode(mode)
        clear()
        self.mode = mode
    end

    local function getSelectedNotes()
        local r = {}
        for _, v in pairs(self.buffer) do
            table.insert(r, v)
        end
        return r
    end

    local function setScale(scale)
        self.scale = scale
        redrawFretboard()
    end

    local function setAccidental(accidental)
        self.accidental = accidental
        redrawFretboard()
    end

    local function setTuning(tuning)
        self.tuning = tuning
        clear()
    end

    return {
        getSelectedNotes = getSelectedNotes,
        setMode = setMode,
        setScale = setScale,
        setAccidental = setAccidental,
        setTuning = setTuning,
        clear = clear,
        render = render,
    }
end

return fretboard
