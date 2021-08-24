local scale_selector = {}

function scale_selector.render(x, y, z, useFlats)
    GUI.New('mnuTonic', 'Menubox', {
        z = z,
        x = x,
        y = y,
        w = 48,
        h = 20,
        caption = 'Scale',
        optarray = {'A', 'A#', 'B', 'C', 'C#'},
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
        optarray = {'---', 'Ionian (Major)', 'Dorian', 'Phrygian', 'Lydian', 'Mixolydian', 'Aeolian (Minor)', 'Locrian'},
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
