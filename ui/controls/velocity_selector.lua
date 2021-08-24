local velocity_selector = {}

local BTN_SPACING_X = 4
local BTN_W = 28

local function drawButtons(x, y, z)
    local id = 0

    for i = 0, 11 do
        id = id + 10
        local name = 'btnVel' .. id
        GUI.New(name, 'Button', {
            z = z,
            x = x + i * (BTN_W + BTN_SPACING_X),
            y = y,
            w = BTN_W,
            h = 24,
            caption = '' .. id,
            font = 3,
            col_txt = 'txt',
            col_fill = 'elm_frame'
        })
    end

    GUI.New('btnVel127', 'Button', {
        z = z,
        x = x + 12 * (BTN_W + BTN_SPACING_X),
        y = y,
        w = 28,
        h = 24,
        caption = '127',
        font = 3,
        col_txt = 'txt',
        col_fill = 'elm_frame'
    })
end

function velocity_selector.render(x, y, z)
    GUI.New('lblVelocity', 'Label', {
        z = z,
        x = x,
        y = y,
        caption = 'Velocity',
        font = 2,
        color = 'txt',
        bg = 'wnd_bg',
        shadow = false
    })

    drawButtons(x + 64, y, z)
end

return velocity_selector
