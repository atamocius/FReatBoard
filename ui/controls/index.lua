local scaleSelector = require('ui/controls/scale_selector')
local velocitySelector = require('ui/controls/velocity_selector')

local index = {}

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

    GUI.New('rdoAccidentals', 'Radio', {
        z = 11,
        x = 85,
        y = 0,
        w = 48,
        h = 56,
        caption = '',
        optarray = {'#', 'b'},
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
        col_fill = 'blue'
    })


    scaleSelector.render(42, 62, 11, false)
    velocitySelector.render(224, 0, 11)


    GUI.New('lblLength', 'Label', {
        z = 11,
        x = 224,
        y = 30,
        caption = 'Length',
        font = 2,
        color = 'txt',
        bg = 'wnd_bg',
        shadow = false
    })

    GUI.New('lblLength1', 'Button', {
        z = 11,
        x = 288,
        y = 30,
        w = 48,
        h = 24,
        caption = '1/128',
        font = 3,
        col_txt = 'txt',
        col_fill = 'elm_frame'
    })

end

return index
