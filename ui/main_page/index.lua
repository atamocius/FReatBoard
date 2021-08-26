local scaleSelector = require('ui/main_page/scale_selector')
local velocitySelector = require('ui/main_page/velocity_selector')
local modeSelector = require('ui/main_page/mode_selector')
local accidentalsSelector = require('ui/main_page/accidentals_selector')
local fretboard = require('ui/main_page/fretboard')

local velocities = require('config/velocities')
local scales = require('config/scales')

local index = {}

function index.newMainPage()
    local self = {
        selectedModeIndex = 1,

        selectedAccidentalIndex = 1,

        selectedVelocityIndex = 10,

        selectedTonicIndex = 1,
        selectedScaleIndex = 1,
    }

    local velSel = nil
    local scaleSel = nil
    local fb = nil

    local function handleVelocityClick(index, value)
        self.selectedVelocityIndex = index
        reaper.ShowConsoleMsg(value .. '\n')
    end

    local function handleModeChange(index, value)
        self.selectedModeIndex = index
        fb.setMode(self.selectedModeIndex)

        reaper.ShowConsoleMsg(index .. ', ' .. value .. '\n')
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

    local function handleFretboardClick(fret, string, note)
        reaper.ClearConsole()

        local selectedNotes = fb.getSelectedNotes()
        for i = 1, #selectedNotes do
            local n = selectedNotes[i]
            reaper.ShowConsoleMsg('fret ' .. n.fret .. ' of the ' .. n.string .. ' string' .. '\n')
        end
        -- reaper.ShowConsoleMsg('fret ' .. fret .. ' of the ' .. string .. ' string' .. '\n')
    end

    local function handleClearClick()
        fb.clear()
    end

    local function handleSubmitClick()
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
                handleScaleChange)
        scaleSel.render()

        velSel = velocitySelector.newVelocitySelector(
            224, 0, 11,
            self.selectedVelocityIndex,
            handleVelocityClick
        )
        velSel.render()

        GUI.New('btnClear', 'Button', {
            z = 11,
            x = 224,
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
            x = 288,
            y = 60,
            w = 256,
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
            handleFretboardClick
        )
        fb.render()
    end

    return {
        render = render
    }
end

return index