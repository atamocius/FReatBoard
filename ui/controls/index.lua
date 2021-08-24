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

    GUI.New("mnuTonic", "Menubox", {
        z = 11,
        x = 42,
        y = 62,
        w = 48,
        h = 20,
        caption = "Scale",
        optarray = {"A", 'A#', 'B', 'C', 'C#'},
        retval = 1.0,
        font_a = 3,
        font_b = 4,
        col_txt = "txt",
        col_cap = "txt",
        bg = "wnd_bg",
        pad = 4,
        noarrow = false,
        align = 0
    })

    GUI.New("mnuScales", "Menubox", {
        z = 11,
        x = 96,
        y = 62,
        w = 100,
        h = 20,
        caption = "",
        optarray = {"---", "Ionian (Major)", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian (Minor)", "Locrian"},
        retval = 1.0,
        font_a = 3,
        font_b = 4,
        col_txt = "txt",
        col_cap = "txt",
        bg = "wnd_bg",
        pad = 4,
        noarrow = false,
        align = 0
    })


    GUI.New("lblVelocity", "Label", {
        z = 11,
        x = 224,
        y = 0,
        caption = "Velocity",
        font = 2,
        color = "txt",
        bg = "wnd_bg",
        shadow = false
    })

    GUI.New("btnVel10", "Button", {
        z = 11,
        x = 288,
        y = 0,
        w = 28,
        h = 24,
        caption = "127",
        font = 3,
        col_txt = "txt",
        col_fill = "elm_frame"
    })


    GUI.New("lblLength", "Label", {
        z = 11,
        x = 224,
        y = 30,
        caption = "Length",
        font = 2,
        color = "txt",
        bg = "wnd_bg",
        shadow = false
    })

    GUI.New("lblLength1", "Button", {
        z = 11,
        x = 288,
        y = 30,
        w = 48,
        h = 24,
        caption = "1/128",
        font = 3,
        col_txt = "txt",
        col_fill = "elm_frame"
    })

end

return index
