local controls = require('ui/controls/index')
local fretboard = require('ui/fretboard/index')

local page = {}

local state = {

}

function page.render()
    controls.render()
    fretboard.render()
end

return page
