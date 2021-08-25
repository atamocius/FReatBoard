local scaleSelector = require('ui/controls/scale_selector')
local velocitySelector = require('ui/controls/velocity_selector')
local accidentalsSelector = require('ui/controls/accidentals_selector')

local velocities = require('config/velocities')

local index = {}

local velSel = nil
local scaleSel = nil

local state = {
    selectedAccidentalIndex = 1,
    useFlats = false,

    selectedVelocityIndex = 10,

    selectedTonicIndex = 1,
    selectedScaleIndex = 1,
}

local function handleVelocityClick(index, value)
    state.selectedVelocityIndex = index
    reaper.ShowConsoleMsg(value .. '\n')
    -- scaleSel.setUseFlats(true)
end

local function handleAccidentalsChange(index, value)
    state.selectedAccidentalIndex = index
    if index == 1 then
        state.useFlats = false
    else
        state.useFlats = true
    end

    scaleSel.setUseFlats(state.useFlats)

    -- reaper.ShowConsoleMsg(index .. ', ' .. value .. '\n')
end

local function handleScaleChange(
    selectedTonicIndex,
    selectedScaleIndex,
    selectedTonicValue,
    selectedScaleValue
)
    -- state.selectedAccidentalIndex = index
    reaper.ShowConsoleMsg(selectedTonicIndex .. '\n')
    reaper.ShowConsoleMsg(selectedScaleIndex .. '\n')
    reaper.ShowConsoleMsg(selectedTonicValue .. '\n')
    reaper.ShowConsoleMsg(selectedScaleValue .. '\n')
end

function index.render()
    GUI.New('rdoMode', 'Radio', {
        z = 11,
        x = 0,
        y = 0,
        w = 85,
        h = 56,
        caption = '',
        optarray = {'Chords', 'Single'},
        dir = 'v',
        font_a = 2,
        font_b = 3,
        col_txt = 'txt',
        col_fill = 'elm_fill',
        bg = 'wnd_bg',
        frame = false,
        shadow = true,
        swap = nil,
        opt_size = 20
    })

    accidentalsSelector
        .newAccidentalsSelector(
            85, 0, 11,
            state.selectedAccidentalIndex,
            handleAccidentalsChange
        )
        .render()


    GUI.New('btnClear', 'Button', {
        z = 11,
        x = 224,
        y = 60,
        w = 48,
        h = 24,
        caption = 'Clear',
        font = 3,
        col_txt = 'txt',
        col_fill = 'red'
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
        col_fill = 'green'
    })


    scaleSel = scaleSelector
        .newScaleSelector(
            42, 62, 11,
            state.selectedTonicIndex,
            state.selectedScaleIndex,
            state.useFlats,
            handleScaleChange)
    scaleSel.render()

    velSel = velocitySelector.newVelocitySelector(
        224, 0, 11,
        state.selectedVelocityIndex,
        handleVelocityClick
    )
    velSel.render()
    -- reaper.ShowConsoleMsg(velSel.getSelectedValue() .. '\n')


    -- GUI.New('lblLength', 'Label', {
    --     z = 11,
    --     x = 224,
    --     y = 30,
    --     caption = 'Length',
    --     font = 2,
    --     color = 'txt',
    --     bg = 'wnd_bg',
    --     shadow = false
    -- })

    -- GUI.New('lblLength1', 'Button', {
    --     z = 11,
    --     x = 288,
    --     y = 30,
    --     w = 48,
    --     h = 24,
    --     caption = '1/128',
    --     font = 3,
    --     col_txt = 'txt',
    --     col_fill = 'elm_frame'
    -- })

end

return index
