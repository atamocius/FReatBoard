local controls = require('ui/controls/index')
local fretboard = require('ui/fretboard/index')

local scales = require('config/scales')

local page = {}

local fb = nil

local function handleFretboardClick(fret, string, note)
    reaper.ShowConsoleMsg('fret ' .. fret .. ' of the ' .. string .. ' string' .. '\n')
end

function page.render()
    controls.render()

    fb = fretboard.newFretboard(
        16, 104, 11,
        scales['Phrygian'][5],
        false,
        handleFretboardClick
    )
    fb.render()
end

return page
