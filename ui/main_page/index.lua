local scaleSelector = require('ui/main_page/scale_selector')
local velocitySelector = require('ui/main_page/velocity_selector')
local modeSelector = require('ui/main_page/mode_selector')
local accidentalsSelector = require('ui/main_page/accidentals_selector')
local tuningSelector = require('ui/main_page/tuning_selector')
local fretboard = require('ui/main_page/fretboard')

local velocities = require('config/velocities')
local scales = require('config/scales')
local tunings = require('config/tunings')

local midi = require('utils/midi')
local undo = require('utils/undo')

local index = {}

function index.newMainPage()
    local self = {
        selectedModeIndex = 1,

        selectedAccidentalIndex = 1,

        selectedVelocityIndex = 10,
        selectedVelocityValue = velocities[10],

        selectedTonicIndex = 1,
        selectedScaleIndex = 1,

        selectedTuningIndex = tunings.DEFAULT_SELECTED_INDEX,

        selectedTuning = tunings.asList[tunings.DEFAULT_SELECTED_INDEX],
    }

    local velSel = nil
    local scaleSel = nil
    local tuningSel = nil
    local fb = nil

    local function handleVelocityClick(index, value)
        self.selectedVelocityIndex = index
        self.selectedVelocityValue = value
        -- reaper.ShowConsoleMsg(value .. '\n')
    end

    local function handleModeChange(index, value)
        self.selectedModeIndex = index
        fb.setMode(self.selectedModeIndex)

        -- reaper.ShowConsoleMsg(index .. ', ' .. value .. '\n')
    end

    local function handleAccidentalsChange(index, value)
        self.selectedAccidentalIndex = index
        scaleSel.setAccidental(self.selectedAccidentalIndex)
        fb.setAccidental(self.selectedAccidentalIndex)

        -- reaper.ShowConsoleMsg(index .. ', ' .. value .. '\n')
    end

    local function handleScaleChange(
        selectedTonicIndex,
        selectedScaleIndex,
        selectedTonicValue,
        selectedScaleValue
    )
        -- reaper.ShowConsoleMsg(selectedTonicIndex .. '\n')
        -- reaper.ShowConsoleMsg(selectedScaleIndex .. '\n')
        -- reaper.ShowConsoleMsg(selectedTonicValue .. '\n')
        -- reaper.ShowConsoleMsg(selectedScaleValue .. '\n')

        if selectedScaleIndex == 1 then
            fb.setScale(nil)
        else -- Ignore if scale name is '---'
            local scale = scales[selectedScaleValue][selectedTonicIndex]
            fb.setScale(scale)
        end
    end

    local function handleTuningChange(
        selectedTuningIndex,
        selectedTuningValue
    )
        -- reaper.ShowConsoleMsg(selectedTuningIndex .. '\n')
        -- reaper.ShowConsoleMsg(selectedTuningValue .. '\n')

        -- Set tuning
        self.selectedTuning = tunings.asDictionary[selectedTuningValue]
        -- reaper.ShowConsoleMsg(t.frets .. '\n')
        fb.setTuning(self.selectedTuning)
    end

    local function handleClearClick()
        fb.clear()
    end

    local function insertNote(string, value, velocity)
        local ch = self.selectedTuning.channels[string]
        midi.insertNote(value, ch - 1, velocity)
    end

    local function handleFretboardClick(fret, string, note)
        if self.selectedModeIndex == 2 then
            undo.beginBlock()

            -- reaper.ClearConsole()
            -- reaper.ShowConsoleMsg('fret ' .. fret .. ' of the ' .. string .. ' string (' .. note.name .. note.octave .. ' ' .. note.value .. ')\n')
            -- reaper.ShowConsoleMsg('velocity: ' .. self.selectedVelocityValue .. '\n')
            insertNote(string, note.value, self.selectedVelocityValue)

            midi.moveCursorToEnd()

            undo.endBlock('FReatBoard: Single note inserted ( ' .. note.name .. note.octave .. ')')
        end
    end

    local function handleSubmitClick()
        if self.selectedModeIndex == 1 then
            undo.beginBlock()

            -- reaper.ClearConsole()
            local notes = fb.getSelectedNotes()
            for i = 1, #notes do
                local n = notes[i]
                -- reaper.ShowConsoleMsg('fret ' .. n.fret .. ' of the ' .. n.string .. ' string (' .. n.note.name .. n.note.octave .. ' ' .. n.note.value .. ')\n')
                insertNote(n.string, n.note.value, self.selectedVelocityValue)
            end
            -- reaper.ShowConsoleMsg('velocity: ' .. self.selectedVelocityValue .. '\n')

            if #notes > 0 then
                midi.moveCursorToEnd()
                fb.clear()
            end

            undo.endBlock('FReatBoard: Chord inserted')
        end
    end

    local function render()
        modeSelector
            .newModeSelector(
                0, 0, 11,
                self.selectedAccidentalIndex,
                handleModeChange
            )
            .render()

        accidentalsSelector
            .newAccidentalsSelector(
                85, 0, 11,
                self.selectedAccidentalIndex,
                handleAccidentalsChange
            )
            .render()

        scaleSel = scaleSelector
            .newScaleSelector(
                42, 62, 11,
                self.selectedTonicIndex,
                self.selectedScaleIndex,
                self.selectedAccidentalIndex,
                handleScaleChange
            )
        scaleSel.render()

        velSel = velocitySelector.newVelocitySelector(
            224, 0, 11,
            self.selectedVelocityIndex,
            handleVelocityClick
        )
        velSel.render()

        tuningSel = tuningSelector.newTuningSelector(
            620, 62, 11,
            self.selectedTuningIndex,
            handleTuningChange
        )
        tuningSel.render()

        GUI.New('btnClear', 'Button', {
            z = 11,
            x = 289,
            y = 60,
            w = 48,
            h = 24,
            caption = 'Clear',
            font = 3,
            col_txt = 'txt',
            col_fill = 'red',
            func = handleClearClick
        })

        GUI.New('btnSubmit', 'Button', {
            z = 11,
            x = 353,
            y = 60,
            w = 210,
            h = 24,
            caption = 'Submit',
            font = 3,
            col_txt = 'txt',
            col_fill = 'green',
            func = handleSubmitClick
        })

        fb = fretboard.newFretboard(
            16, 104, 11,
            1,
            nil,
            1,
            tunings.asList[self.selectedTuningIndex],
            handleFretboardClick
        )
        fb.render()
    end

    return {
        render = render
    }
end

return index
