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
        x = 144,
        y = 16,
        w = 48,
        h = 24,
        caption = 'Clear',
        font = 3,
        col_txt = 'txt',
        col_fill = 'red'
    })

    GUI.New('sldVelocity', 'Slider', {
        z = 11,
        x = 240,
        y = 32,
        w = 128,
        caption = 'Velocity',
        min = 1,
        max = 127,
        defaults = {63},
        inc = 1,
        dir = 'h',
        font_a = 3,
        font_b = 4,
        col_txt = 'txt',
        col_fill = 'elm_fill',
        bg = 'wnd_bg',
        show_handles = true,
        show_values = true,
        cap_x = 0,
        cap_y = 0
    })

    GUI.New('mnbNoteLength', 'Menubox', {
        z = 11,
        x = 416,
        y = 16,
        w = 64,
        h = 20,
        caption = 'Length',
        optarray = {
            '1/128',
            '1/64',
            '1/32',
            '1/16',
            '1/8',
            '1/4',
            '1/2',
            '1',
            '2',
            '4',
        },
        retval = 4,
        font_a = 3,
        font_b = 4,
        col_txt = 'txt',
        col_cap = 'txt',
        bg = 'wnd_bg',
        pad = 4,
        noarrow = false,
        align = 0
    })

    GUI.New('btnSubmit', 'Button', {
        z = 11,
        x = 496,
        y = 16,
        w = 256,
        h = 24,
        caption = 'Submit',
        font = 3,
        col_txt = 'txt',
        col_fill = 'blue'
    })
end

return index
