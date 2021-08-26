local controls = require('ui/controls/index')
local fretboard = require('ui/fretboard/index')

local scales = require('config/scales')

local page = {}

local fb = nil

local function handleFretboardClick(fret, string, note)
    reaper.ClearConsole()

    local selectedNotes = fb.getSelectedNotes()
    for i = 1, #selectedNotes do
        local n = selectedNotes[i]
        reaper.ShowConsoleMsg('fret ' .. n.fret .. ' of the ' .. n.string .. ' string' .. '\n')
    end
    -- reaper.ShowConsoleMsg('fret ' .. fret .. ' of the ' .. string .. ' string' .. '\n')
end

function page.render()
    controls.render()

    fb = fretboard.newFretboard(
        16, 104, 11,
        1,
        scales['Phrygian'][5],
        false,
        handleFretboardClick
    )
    fb.render()
end

return page
