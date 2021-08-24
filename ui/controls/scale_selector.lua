local scales = require('config/scales')
local scaleUtils = require('config/scale_utils')
local utils = require('utils/utils')

local scale_selector = {}

function scale_selector.render(x, y, z, useFlats)
    local accidental = 1
    if useFlats then accidental = 2 end

    local noteNames = scaleUtils.NOTES[accidental]
    local scaleNames = utils.clone(scales.keys)

    table.insert(scaleNames, 1, '---')

    GUI.New('mnuTonic', 'Menubox', {
        z = z,
        x = x,
        y = y,
        w = 48,
        h = 20,
        caption = 'Scale',
        optarray = noteNames,
        retval = 1.0,
        font_a = 3,
        font_b = 4,
        col_txt = 'txt',
        col_cap = 'txt',
        bg = 'wnd_bg',
        pad = 4,
        noarrow = false,
        align = 0
    })

    GUI.New('mnuScale', 'Menubox', {
        z = z,
        x = x + 54,
        y = y,
        w = 100,
        h = 20,
        caption = '',
        optarray = scaleNames,
        retval = 1.0,
        font_a = 3,
        font_b = 4,
        col_txt = 'txt',
        col_cap = 'txt',
        bg = 'wnd_bg',
        pad = 4,
        noarrow = false,
        align = 0
    })
end

return scale_selector
